extern crate stdweb;

use stdweb::web::{document, INode};

fn main() {
    stdweb::initialize();

    if let Some(content) = document().query_selector("#content") {
        let hello_div = document().create_element("div");
        hello_div.set_text_content("Hello from Rust!");
        content.append_child(&hello_div);
    }

    stdweb::event_loop();
}

#[no_mangle]
pub fn add(a: i32, b: i32) -> i32 {
    return a + b;
}
