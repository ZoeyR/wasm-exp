
.PHONY: all debug serve

all:
	cargo build --target=wasm32-unknown-emscripten --release
	mkdir -p site
	find target/wasm32-unknown-emscripten/release/deps -type f -name "*.wasm" | xargs -I {} cp {} site/site.wasm
	find target/wasm32-unknown-emscripten/release/deps -type f ! -name "*.asm.js" -name "*.js" | xargs -I {} cp {} site/site.js

debug:
	cargo build --target=wasm32-unknown-emscripten
	mkdir -p site
	find target/wasm32-unknown-emscripten/debug/deps -type f -name "*.wasm" | xargs -I {} cp {} site/site.wasm
	find target/wasm32-unknown-emscripten/debug/deps -type f ! -name "*.asm.js" -name "*.js" | xargs -I {} cp {} site/site.js

serve: debug
	pushd site; python -m http.server; popd