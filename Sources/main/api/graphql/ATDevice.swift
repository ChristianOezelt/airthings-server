import Foundation
import Graphiti
import Vapor

struct ATDevice : Codable {
    let id: String
    let type: String

    static func type() -> Component<ATDeviceResolver, Request> {
        Type(ATDevice.self){
            Field("id", at: \.id)
            Field("type", at: \.type)
        }
    }
}
