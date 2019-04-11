import Foundation

extension URLRequest {
    var httpieDescription: String {
        var components: [String] = []
        components.append("http")
        if let method = self.httpMethod {
            components.append(method)
        }
        if let url = self.url {
            components.append("'\(url.absoluteString)'")
        }

        if let headers = self.allHTTPHeaderFields {
            for (key, value) in headers {
                components.append("'\(key)':'\(value)'")
            }
        }

        if let body = self.httpBody,
            let bodyString = String(data: body, encoding: .utf8) {
            components.insert("echo '\(bodyString)' |", at: 0)
        }

        return components.joined(separator: " ")
    }
}
