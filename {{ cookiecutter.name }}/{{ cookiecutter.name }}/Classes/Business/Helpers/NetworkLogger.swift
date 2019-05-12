import Foundation

protocol LoggerTargetProtocol {
    var description: String { get }
}

enum NetworkLogger {
    static func logTarget(_ target: LoggerTargetProtocol) {
        log.debug("TARGET =>> %{public}@", logger: .general, target.description)
    }

    static func logRequest(_ request: URLRequest) {
        logMessageBlock {
            log.debug("**REQUEST** =>> %{public}@", logger: .network, request.httpieDescription)
        }
    }

    static func logResponse(_ data: Data?) {
        guard let data = data,
            let string = String(data: data, encoding: .utf8) else {
            return
        }
        logMessageBlock {
            log.debug("**RESPONSE** =>> %{public}@", logger: .network, string)
        }
    }

    static func logError(_ error: Error) {
        logMessageBlock {
            log.error("**RESPONSE ERROR** =>> %{public}@", logger: .network, error.localizedDescription)
        }
    }

    private static func logMessageBlock(_ logClosure: () -> Void) {
        switch ProjectConfiguration.current {
        case .debug, .internal:
            logClosure()
        case .release:
            break
        }
    }
}
