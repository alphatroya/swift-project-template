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
        guard let string = data.flatMap({ String(data: $0, encoding: .utf8) }) else {
            log.debug("**RESPONSE** =>> [EMPTY BODY]", logger: .network)
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
        case .debug:
            logClosure()
        case .release:
            break
        }
    }
}
