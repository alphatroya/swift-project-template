import Foundation
import os.log

final class LogManager {
    func verbose(_ string: StaticString, logger: OSLog = .general, _ args: CVarArg...) {
        log(string, level: .debug, logger: logger, args)
    }

    func debug(_ string: StaticString, logger: OSLog = .general, _ args: CVarArg...) {
        log(string, level: .info, logger: logger, args)
    }

    func error(_ string: StaticString, logger: OSLog = .general, _ args: CVarArg...) {
        log(string, level: .error, logger: logger, args)
    }

    private func log(_ string: StaticString, level: OSLogType, logger: OSLog, _ args: CVarArg...) {
        switch args.count {
        case 0:
            os_log(string, log: logger, type: level)
        case 1:
            os_log(string, log: logger, type: level, args[0])
        case 2:
            os_log(string, log: logger, type: level, args[0], args[1])
        case 3:
            os_log(string, log: logger, type: level, args[0], args[1], args[2])
        default:
            os_log(string, log: logger, type: level, args)
        }
    }
}

extension OSLog {
    private static let subsystem = Bundle.main.bundleIdentifier
    static let general = OSLog(subsystem: subsystem ?? "", category: "general")
    static let ui = OSLog(subsystem: subsystem ?? "", category: "ui")
    static let network = OSLog(subsystem: subsystem ?? "", category: "network")
}

// swiftlint:disable:next prefixed_toplevel_constant
let log = LogManager()
