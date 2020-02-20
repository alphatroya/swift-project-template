import Foundation

extension URLRequest {
    var cURL: String {
        guard let url = self.url,
            let method = self.httpMethod else {
            return "cURL command can't be generated"
        }

        var components = ["curl -v -X \(method)"]

        if let headerFields = self.allHTTPHeaderFields {
            for (field, value) in headerFields where field != "Cookie" {
                components.append("-H '\(field): \(value)'")
            }
        }

        if let httpBody = self.httpBody
            .flatMap({ String(data: $0, encoding: .utf8) }) {
            components.append("-d '\(httpBody)'")
        }

        components.append("'\(url.absoluteString)'")

        return components.joined(separator: " ")
    }
}
