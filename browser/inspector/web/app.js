const LIMIT = 524288, ENVELOPE = 2097152;
const FILE_MS = 5000, START_MS = 12000, COMPUTE_MS = 10000;
const $ = id => document.getElementById(id);
const run = $('run'), status = $('status'), error = $('error');
const encoder = new TextEncoder();
const documents = new Map();
let revision = 0, nextJob = 0, worker, ready = false, active, startTimer, examples;

function download(name, bytes, type = 'text/plain;charset=utf-8') {
  const url = URL.createObjectURL(new Blob([bytes], {type}));
  const link = document.createElement('a');
  link.href = url; link.download = name; link.click();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}
function button(label, action) {
  const element = document.createElement('button');
  element.type = 'button'; element.textContent = label;
  element.addEventListener('click', action); return element;
}
function controls() {
  run.disabled = !ready || Boolean(active) || [...documents.values()].some(d => d.reader);
  $('result').setAttribute('aria-busy', String(Boolean(active)));
}
function discardResult() {
  revision++;
  $('report').textContent = '';
  $('summary').textContent = 'Inputs changed. Inspect again for a current result.';
  $('exports').replaceChildren();
  error.textContent = '';
  if (active) {
    clearTimeout(active.timer); active = undefined;
    boot('Inputs changed. Restarting Rust…');
  }
  controls();
}
function metadata(doc) {
  const bytes = encoder.encode(doc.text).length;
  const transport = [doc.text.startsWith('\uFEFF') ? 'BOM present' : 'no BOM',
    doc.text.includes('\r') ? 'CR/CRLF retained' : 'LF editing text'];
  doc.meta.textContent = `${bytes.toLocaleString()} UTF-8 bytes · ${transport.join(' · ')}. ` +
    (doc.original ? `Original retained: ${doc.original.name}. ` : '') +
    'Textarea display may use LF; the payload remains unchanged until you edit or request an LF copy.';
  doc.save.disabled = bytes === 0 || bytes > LIMIT || Boolean(doc.reader);
  doc.saveOriginal.disabled = !doc.original || Boolean(doc.reader);
}
function cancelRead(doc) {
  doc.readToken++;
  if (doc.reader) {
    clearTimeout(doc.readTimer);
    const reader = doc.reader; doc.reader = undefined; reader.abort();
  }
}
function setDocument(doc, text, original) {
  cancelRead(doc); doc.text = text; doc.area.value = text; doc.original = original;
  metadata(doc);
}
function importFile(doc, file) {
  cancelRead(doc); discardResult();
  if (!file) { controls(); return; }
  if (file.size > LIMIT) {
    error.textContent = `${doc.label}: file exceeds 512 KiB. Previous input retained.`;
    metadata(doc); controls(); return;
  }
  const token = doc.readToken, reader = new FileReader();
  doc.reader = reader; metadata(doc); controls();
  status.textContent = `Reading ${doc.label.toLowerCase()}…`;
  const finish = (message, failed = false) => {
    if (doc.reader !== reader || doc.readToken !== token) return false;
    clearTimeout(doc.readTimer); doc.reader = undefined;
    if (failed) error.textContent = `${doc.label}: ${message} Previous input retained.`;
    else status.textContent = message;
    metadata(doc); controls(); return true;
  };
  doc.readTimer = setTimeout(() => {
    if (finish('file read timed out after 5 seconds.', true)) reader.abort();
  }, FILE_MS);
  reader.onload = () => {
    if (doc.reader !== reader || doc.readToken !== token) return;
    try {
      const bytes = new Uint8Array(reader.result);
      if (bytes.byteLength > LIMIT) throw new Error('file exceeds 512 KiB.');
      const text = new TextDecoder('utf-8', {fatal: true, ignoreBOM: true}).decode(bytes);
      finish('File loaded. Original bytes retained; inspect to validate.');
      discardResult(); setDocument(doc, text, {bytes, name: file.name});
      controls();
    } catch {
      finish('file is not valid bounded UTF-8.', true);
    }
  };
  reader.onerror = () => finish('file could not be read.', true);
  reader.onabort = () => finish('file read cancelled.', true);
  try { reader.readAsArrayBuffer(file); }
  catch { finish('file read could not start.', true); }
}

for (const [key, label, optional] of [
  ['reference', 'Reference', false], ['relations', 'Relations', true], ['query', 'Query', true],
]) {
  const doc = {key, label, text: '', readToken: 0};
  const field = document.createElement('fieldset'), legend = document.createElement('legend');
  legend.textContent = label + (optional ? ' (optional)' : ' (required)'); field.append(legend);
  const fileLabel = document.createElement('label'); fileLabel.htmlFor = `${key}-file`;
  fileLabel.textContent = `Import ${label.toLowerCase()} as UTF-8`;
  const file = document.createElement('input'); file.type = 'file'; file.id = fileLabel.htmlFor;
  file.addEventListener('change', () => { importFile(doc, file.files[0]); file.value = ''; });
  const textLabel = document.createElement('label'); textLabel.htmlFor = key;
  textLabel.textContent = `${label} text`;
  doc.area = document.createElement('textarea'); doc.area.id = key; doc.area.spellcheck = false;
  // maxlength would silently truncate a paste. Reject oversized paste/drop
  // operations as a whole; edited input still passes native byte admission.
  doc.area.setAttribute('aria-describedby', `${key}-meta`);
  for (const eventType of ['paste', 'drop']) doc.area.addEventListener(eventType, event => {
    const text = (event.clipboardData || event.dataTransfer)?.getData('text/plain') || '';
    if (text.length > LIMIT || encoder.encode(text).length > LIMIT) {
      event.preventDefault(); cancelRead(doc); discardResult(); metadata(doc);
      error.textContent = `${doc.label}: ${eventType} exceeds 512 KiB of UTF-8. Previous input retained.`;
      status.textContent = 'Oversized edit rejected without truncating input.';
    }
  });
  doc.area.addEventListener('input', () => {
    cancelRead(doc); discardResult(); doc.text = doc.area.value;
    metadata(doc); status.textContent = 'Input edited. Inspect again.';
  });
  doc.meta = document.createElement('p'); doc.meta.id = `${key}-meta`; doc.meta.className = 'metadata';
  const actions = document.createElement('div'); actions.className = 'actions';
  doc.save = button(`Save current ${key}`, () => download(`lexicon-${key}-input.txt`, doc.text));
  doc.saveOriginal = button(`Save original ${key}`, () => {
    if (doc.original) download(`lexicon-${key}-original.bin`, doc.original.bytes, 'application/octet-stream');
  });
  actions.append(doc.save, doc.saveOriginal, button(`Create LF copy of ${key}`, () => {
    cancelRead(doc); discardResult();
    doc.text = doc.text.replace(/^\uFEFF/, '').replace(/\r\n?/g, '\n');
    doc.area.value = doc.text; metadata(doc);
    status.textContent = 'LF editing copy created and BOM removed. ' +
      (doc.original ? 'Imported original retained. ' : '') + 'Rust must validate again.';
  }));
  field.append(fileLabel, file, textLabel, doc.area, doc.meta, actions);
  $('documents').append(field); documents.set(key, doc); metadata(doc);
}

function failWorker(message, candidate = worker) {
  if (candidate !== worker) return;
  clearTimeout(startTimer);
  if (active) clearTimeout(active.timer);
  active = undefined; ready = false; worker?.terminate();
  worker = undefined;
  $('report').textContent = ''; $('exports').replaceChildren();
  $('summary').textContent = 'No current result.';
  error.textContent = message + ' Inputs are retained. Use Restart Rust worker to retry.';
  status.textContent = 'Rust unavailable.'; controls();
}
function boot(message = 'Starting Rust…') {
  if (worker) worker.terminate();
  worker = undefined;
  clearTimeout(startTimer);
  if (active) clearTimeout(active.timer);
  active = undefined; ready = false; status.textContent = message; controls();
  let candidate;
  try { candidate = new Worker('./worker.js', {type: 'module'}); }
  catch { error.textContent = 'Cannot create the Rust worker. Inputs retained. Restart to retry.'; return; }
  worker = candidate;
  startTimer = setTimeout(() => failWorker('Rust startup timed out after 12 seconds.', candidate), START_MS);
  candidate.onerror = event => { event.preventDefault(); failWorker('Rust worker failed.', candidate); };
  candidate.onmessage = ({data}) => {
    if (candidate !== worker) return;
    if (data.type === 'ready') {
      clearTimeout(startTimer); ready = true; status.textContent = 'Rust ready. Supply documents or load an example.'; controls();
    } else if (data.type === 'result' && active && data.id === active.id && active.revision === revision) {
      clearTimeout(active.timer); active = undefined; controls();
      try {
        const result = JSON.parse(data.canonical);
        $('report').textContent = data.canonical;
        if (!result.ok) {
          error.textContent = result.diagnostic.message;
          $('summary').textContent = 'Rust rejected the supplied documents. No validated exports.';
          status.textContent = 'Inspection rejected. Edit inputs and retry.'; return;
        }
        const query = result.query ? ` Query declared state: ${result.query.declared_state}; supplied source hashes passed.` : ' Query not requested.';
        $('summary').textContent = `Reference grammar passed: ${result.reference.entry_count} entries, ${result.reference.view_count} views.` +
          (result.relations ? ` Relations grammar passed: ${result.relations.count} records.` : ' Relations not requested.') + query +
          ' Workspace files, Markdown and review assurance: NOT PERFORMED. This is not semantic or publication approval.';
        const exports = $('exports');
        exports.append(button('Save native report', () => download('lexicon-inspection.json', data.canonical, 'application/json')),
          button('Save exact request', () => download('lexicon-request.json', result.request_json, 'application/json')));
        for (const key of documents.keys()) {
          if (result[key]) exports.append(button(`Save canonical ${key}`, () =>
            download(`lexicon-${key}-canonical.txt`, result[key].canonical_text)));
        }
        status.textContent = 'Inspection complete. Downloads apply to these current inputs.';
      } catch { failWorker('Invalid worker response.', candidate); }
    } else if (data.type === 'fatal') failWorker('Rust could not complete inspection.', candidate);
  };
}

run.addEventListener('click', () => {
  if (run.disabled) return;
  discardResult();
  const payload = Object.fromEntries([...documents].map(([key, doc]) => [key, doc.text]));
  if ([...documents.values()].some(doc => encoder.encode(doc.text).length > LIMIT)) {
    error.textContent = 'Each document must be at most 512 KiB of UTF-8. Reduce the input and retry.'; return;
  }
  const request = JSON.stringify(payload);
  if (encoder.encode(request).length > ENVELOPE) {
    error.textContent = 'The JSON request envelope exceeds 2 MiB. Reduce the input and retry.'; return;
  }
  const id = ++nextJob;
  active = {id, revision, timer: setTimeout(() => failWorker('Inspection timed out after 10 seconds.'), COMPUTE_MS)};
  controls(); status.textContent = 'Inspecting in Rust…';
  try { worker.postMessage({id, request}); }
  catch { failWorker('Could not send the request to Rust.'); }
});
$('restart').addEventListener('click', () => { discardResult(); boot(); });
$('clear').addEventListener('click', () => {
  discardResult(); for (const doc of documents.values()) setDocument(doc, '', undefined);
  controls(); status.textContent = ready ? 'Inputs cleared. Rust ready.' : 'Inputs cleared. Rust starting or unavailable.';
});
document.querySelectorAll('[data-example]').forEach(element => element.addEventListener('click', () => {
  const sample = examples[element.dataset.example]; discardResult();
  for (const [key, doc] of documents) setDocument(doc, sample[key] || '', undefined);
  controls(); status.textContent = 'Authored example loaded. Inspect to validate.';
}));
boot();
const controller = new AbortController(), sampleTimer = setTimeout(() => controller.abort(), FILE_MS);
try {
  const response = await fetch('./examples.json', {signal: controller.signal});
  if (!response.ok) throw new Error('examples unavailable');
  examples = await response.json();
  document.querySelectorAll('[data-example]').forEach(element => { element.disabled = false; });
  if (revision === 0 && [...documents.values()].every(doc => doc.text === '')) {
    setDocument(documents.get('reference'), examples['reference-only'].reference, undefined);
    if (ready) status.textContent = 'Authored reference example loaded. Inspect it or supply your own documents.';
  }
} catch {
  error.textContent = 'Authored examples could not load. Your own documents can still be inspected.';
} finally { clearTimeout(sampleTimer); }
