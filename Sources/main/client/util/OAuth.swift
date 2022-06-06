import Foundation

class OAuth {
    static func getAccessToken() async throws -> OAuthResponse {
        let authorization = ProcessInfo.processInfo.environment["OAUTH_BASIC_AUTH_HEADER"] ?? "todo"
        let url = URL(string: "https://accounts-api.airthings.com/v1/token")!
        var request = URLRequest(url: url);

        request.httpMethod = "POST";

        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")

        request.httpBody = "grant_type=client_credentials&scope=read:device:current_values".data(using: .utf8)!;

        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(OAuthResponse.self, from: data)

        return response
    }
}

struct OAuthResponse: Codable {
    let accessToken: String

    public enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}