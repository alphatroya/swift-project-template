import Foundation

protocol LoggerTargetProtocol {
    var description: String { get }
}

final class NetworkLogger {
    func logTarget(_ target: LoggerTargetProtocol) {
        log.debug("TARGET =>> %{public}@", logger: .general, target.description)
    }

    func logRequest(_ request: URLRequest) {
        logMessageBlock {
            log.debug("**REQUEST** =>> %{public}@", logger: .network, request.cURL)
        }
    }

    func logResponse(_ data: Data?) {
        guard let string = data.flatMap({ String(data: $0, encoding: .utf8) }) else {
            log.debug("**RESPONSE** =>> [EMPTY BODY]", logger: .network)
            return
        }
        logMessageBlock {
            log.debug("**RESPONSE** =>> %{public}@", logger: .network, string)
        }
    }

    func logError(_ error: Error) {
        logMessageBlock {
            log.error("**RESPONSE ERROR** =>> %{public}@", logger: .network, "\(error)")
        }
    }

    private func logMessageBlock(_ log: () -> Void) {
        #if DEBUG
        log()
        #endif
    }
}
