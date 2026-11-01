from http.server import ThreadingHTTPServer,SimpleHTTPRequestHandler
from functools import partial
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
ThreadingHTTPServer(('127.0.0.1',4188),partial(SimpleHTTPRequestHandler,directory=str(ROOT/'target/inspector-preview'))).serve_forever()
