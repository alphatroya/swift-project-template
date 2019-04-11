import Foundation
import os.log

protocol LoggerTargetProtocol {}

enum NetworkLogger {
    private static let subsystem = Bundle.main.bundleIdentifier
    private static let network = "network-info"
    private static let logger = OSLog(subsystem: subsystem ?? "", category: network)

    static func logTarget(_ target: LoggerTargetProtocol) {
        log.verbose("TARGET =>> \(target)")
    }

    static func logRequest(_ request: URLRequest) {
        logMessageBlock {
            os_log("**REQUEST** =>> %{public}@", log: logger, type: .info, request.httpieDescription)
        }
    }

    static func logResponse(_ data: Data?) {
        guard let data = data,
            let string = String(data: data, encoding: .utf8) else {
            return
        }
        logMessageBlock {
            os_log("**RESPONSE** =>> %{public}@", log: logger, type: .info, string)
        }
    }

    static func logError(_ error: Error) {
        logMessageBlock {
            os_log("**RESPONSE ERROR** =>> %{public}@", log: logger, type: .fault, error.localizedDescription)
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
