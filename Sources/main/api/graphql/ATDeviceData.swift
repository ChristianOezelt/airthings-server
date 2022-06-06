import Foundation
import Graphiti
import Vapor

struct ATDeviceData : Codable {
    var battery: Int?
    let humidity: Double?
    let temperature: Double?
    let voc: Double?

    static func type() -> Component<ATDeviceResolver, Request> {
        Type(ATDeviceData.self){
            Field("battery", at: \.battery )
            Field("humidity", at: \.humidity)
            Field("temperature", at: \.temperature)
            Field("voc", at: \.voc)
        }
    }
}