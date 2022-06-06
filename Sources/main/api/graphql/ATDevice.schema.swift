import Foundation
import Graphiti
import Vapor

let ATDeviceSchema = try! Schema<ATDeviceResolver, Request> {
    ATDevice.type()
    ATDeviceData.type()

    Query {
        Field("devices", at: ATDeviceResolver.getAllDevices)
        Field("deviceData", at: ATDeviceResolver.getDeviceData) {
            Argument("id", at: \.id)
        }
    }
}