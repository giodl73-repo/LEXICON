"""Build a local draft inspector and exact native/WASM verification cases."""
import hashlib,json,os,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[1]
def capture(*args):return subprocess.check_output(args,cwd=ROOT).decode('utf-8').strip()
def run(*args):subprocess.run(args,cwd=ROOT,check=True)
if capture('wasm-bindgen','--version')!='wasm-bindgen 0.2.127':raise ValueError('Use bindings 0.2.127')
manifest='browser/inspector/Cargo.toml'
run('cargo','+1.95.0','build','--locked','--release','--target','wasm32-unknown-unknown','--manifest-path',manifest,'--lib','--features','wasm')
run('cargo','+1.95.0','build','--locked','--manifest-path',manifest,'--bin','lexicon-inspect')
meta=json.loads(capture('cargo','+1.95.0','metadata','--locked','--manifest-path',manifest,'--format-version','1','--no-deps'));target=Path(meta['target_directory'])
out=ROOT/'target/inspector-preview';out.mkdir(parents=True,exist_ok=True)
assert out.resolve().is_relative_to((ROOT/'target').resolve()) and not out.is_symlink()
run('wasm-bindgen',str(target/'wasm32-unknown-unknown/release/lexicon_inspector.wasm'),'--target','web','--out-dir',str(out/'pkg'))
binary=target/'debug'/('lexicon-inspect.exe' if os.name=='nt' else 'lexicon-inspect')
examples=json.loads(capture(str(binary),'--examples'));cases=[]
def case(name,text):
 p=out/'request.json';p.write_text(text,encoding='utf-8',newline='');canonical=capture(str(binary),str(p));json.loads(canonical);cases.append({'name':name,'input':text,'canonical':canonical})
for name,request in examples.items():case(name,json.dumps(request,ensure_ascii=False,indent=2))
for i in range(32):
 req=json.loads(json.dumps(examples['reference-only']));req['reference']=req['reference'].replace('sample','sample-'+str(i));case('identity-'+str(i),json.dumps(req,ensure_ascii=False))
def changed(name,change,base='declared-query'):
 req=dict(examples[base]);change(req);case(name,json.dumps(req,ensure_ascii=False))
changed('source-digest-mismatch',lambda r:r.update(reference=r['reference'].replace('Authored inspector example only.','Changed supplied metadata.')))
changed('query-needs-relations',lambda r:r.update(relations=''))
changed('bad-query-header',lambda r:r.update(query=r['query'].replace('lexicon-composition-query-v2','invalid-query-header')))
changed('bad-relation-header',lambda r:r.update(relations='invalid-relations\nend-relations\n'))
changed('crlf-document',lambda r:r.update(reference=r['reference'].replace('\n','\r\n')))
changed('bom-document',lambda r:r.update(reference='\ufeff'+r['reference']))
changed('missing-final-lf',lambda r:r.update(reference=r['reference'].rstrip('\n')))
changed('unknown-field',lambda r:r.update(extra=True))
changed('over-document',lambda r:r.update(reference=' '*524289))
changed('unicode-markup',lambda r:r.update(reference=r['reference'].replace('Sample Entry','Café 🌿 <img src=x onerror=alert(1)>')),base='reference-only')
case('current-reference-only',json.dumps({'reference':(ROOT/'reference/lexicon-reference-v4.lexicon').read_text(encoding='utf-8')},ensure_ascii=False))
case('invalid-json','{broken');case('over-envelope',' '*(2097152+1))
sample=json.dumps(examples['declared-query'],indent=2);case('crlf-envelope',sample.replace('\n','\r\n'))
(out/'native-cases.json').write_text(json.dumps(cases,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
(out/'worker.js').write_text("import init,{inspect} from './pkg/lexicon_inspector.js';try{await init();postMessage({type:'ready'});}catch{postMessage({type:'error'});}onmessage=({data})=>{try{postMessage({type:'result',canonical:inspect(data)});}catch{postMessage({type:'error'});}};",encoding='utf-8')
(out/'index.html').write_text('''<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Lexicon inspector · local draft</title><body><h1>Lexicon interchange inspector · local draft</h1><p>Auxiliary parser/source checks only. No Markdown/review assurance or publication approval. Full UI and release qualification remain pending.</p><label for="request">JSON envelope with reference, optional relations and query strings</label><textarea id="request" rows="18" style="width:95%"></textarea><button id="run" disabled>Inspect supplied text</button><p id="status" role="status">Loading Rust…</p><pre id="report" style="white-space:pre-wrap;overflow-wrap:anywhere"></pre><script type="module">
const request=document.getElementById('request'),run=document.getElementById('run'),status=document.getElementById('status'),report=document.getElementById('report');const worker=new Worker('./worker.js',{type:'module'});worker.onmessage=({data})=>{if(data.type==='ready'){run.disabled=false;status.textContent='Rust ready.';}else if(data.type==='result'){report.textContent=data.canonical;status.textContent='Inspection returned.';}else status.textContent='Rust unavailable.';};run.onclick=()=>{report.textContent='';worker.postMessage(request.value);};request.oninput=()=>report.textContent='';
</script></body></html>''',encoding='utf-8')
wasm=out/'pkg/lexicon_inspector_bg.wasm';print(json.dumps({'draft_only':True,'cases':len(cases),'wasm_bytes':wasm.stat().st_size,'wasm_sha256':hashlib.sha256(wasm.read_bytes()).hexdigest()}))
