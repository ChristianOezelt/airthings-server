import Graphiti
import Vapor

final class ATDeviceResolver {
    func getAllDevices(request: Request, _: NoArguments) throws -> EventLoopFuture<[ATDevice]> {
        request.eventLoop.performWithTask {
            let response = try await DevicesAPI.devicesList()

            return response.devices?.map { device in
                ATDevice(id: device._id, type: device.deviceType.rawValue)
            } ?? []
        }
    }

    func getDeviceData(request: Request, arguments: GetDeviceDataArguments) throws -> EventLoopFuture<ATDeviceData> {
        request.eventLoop.performWithTask {
            let response = try await DevicesAPI.deviceSamplesLatestValues(id: arguments.id)

            return ATDeviceData(battery: response.data.battery, humidity: response.data.humidity, temperature: response.data.temp, voc: response.data.voc)
        }
    }
}

public struct GetDeviceDataArguments: Codable {
    public let id: String
}