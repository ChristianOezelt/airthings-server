import Vapor

let app = try Application(.detect())
defer { app.shutdown() }

app.get("hello", ":name") {  req -> String in
    let name = req.parameters.get("name")!
    return "Hello, \(name)!"
}

try app.run()
