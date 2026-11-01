import init, {inspect} from './pkg/lexicon_inspector.js';
try {
  await init();
  self.postMessage({type: 'ready'});
  self.onmessage = ({data}) => {
    try {
      self.postMessage({type: 'result', id: data.id, canonical: inspect(data.request)});
    } catch {
      self.postMessage({type: 'fatal', id: data.id});
    }
  };
} catch {
  self.postMessage({type: 'fatal'});
}
