import GraphQL
import Vapor
import GraphQLKit
import GraphiQLVapor

let app = try Application(.detect())
defer {
    app.shutdown()
}

app.register(graphQLSchema: ATDeviceSchema, withResolver: ATDeviceResolver())
app.enableGraphiQL()

try app.run()
