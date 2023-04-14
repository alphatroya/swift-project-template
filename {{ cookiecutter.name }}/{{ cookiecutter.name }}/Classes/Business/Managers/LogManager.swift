import Foundation
import os.log

final class LogManager {
    func debug(_ string: StaticString, logger: OSLog = .general, _ args: CVarArg...) {
        switch args.count {
        case 0:
            os_log(string, log: logger, type: .info)
        case 1:
            os_log(string, log: logger, type: .info, args[0])
        case 2:
            os_log(string, log: logger, type: .info, args[0], args[1])
        case 3:
            os_log(string, log: logger, type: .info, args[0], args[1], args[2])
        default:
            os_log(string, log: logger, type: .info, args)
        }
    }

    func error(_ string: StaticString, logger: OSLog = .general, _ args: CVarArg...) {
        switch args.count {
        case 0:
            os_log(string, log: logger, type: .error)
        case 1:
            os_log(string, log: logger, type: .error, args[0])
        case 2:
            os_log(string, log: logger, type: .error, args[0], args[1])
        case 3:
            os_log(string, log: logger, type: .error, args[0], args[1], args[2])
        default:
            os_log(string, log: logger, type: .error, args)
        }
    }
}

extension OSLog {
    private static let subsystem = Bundle.main.bundleIdentifier
    static let general = OSLog(subsystem: subsystem ?? "", category: "general")
    static let ui = OSLog(subsystem: subsystem ?? "", category: "ui")
    static let network = OSLog(subsystem: subsystem ?? "", category: "network")
}

let log = LogManager()
