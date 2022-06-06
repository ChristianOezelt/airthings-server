import Foundation

open class DevicesAPI {

    open class func deviceSamplesLatestValues(id: String) async throws -> DeviceSampleResponse {
        try await simpleRequest(path: "devices/\(id)/latest-samples", type: DeviceSampleResponse.self)
    }

    open class func devicesList() async throws -> GetDevicesResponse {
        try await simpleRequest(path: "devices", type: GetDevicesResponse.self)
    }

    open class func simpleRequest<T>(path: String, type: T.Type) async throws -> T where T: Decodable {
        let oauthResponse = try await OAuth.getAccessToken()

        let url = URL(string: "https://ext-api.airthings.com/v1/\(path)")!
        var request = URLRequest(url: url);

        request.setValue("Bearer \(oauthResponse.accessToken)", forHTTPHeaderField: "Authorization")

        let (data, _) = try await  URLSession.shared.data(for: request)
        let decodedType = try JSONDecoder().decode(type, from: data)

        return decodedType;
    }
}
