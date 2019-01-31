import Foundation
import XCGLogger

// swiftlint:disable:next prefixed_toplevel_constant
let log: XCGLogger = {
    let log = XCGLogger(identifier: "XCGLogger", includeDefaultDestinations: false)

    let systemLogDestination = ConsoleDestination(owner: log, identifier: "XCGLogger.console")

    switch ProjectConfiguration.current {
    case .debug, .internal:
        systemLogDestination.outputLevel = .verbose
    case .release:
        systemLogDestination.outputLevel = .severe
    }

    systemLogDestination.showLogIdentifier = false
    systemLogDestination.showFunctionName = false
    systemLogDestination.showThreadName = false
    systemLogDestination.showLevel = true
    systemLogDestination.showFileName = true
    systemLogDestination.showLineNumber = true
    systemLogDestination.showDate = true
    systemLogDestination.levelDescriptions = [
        .info: "INFO",
        .verbose: "VERBOSE",
        .warning: "WARNING",
        .error: "ERROR",
        .debug: "DEBUG",
    ]

    log.add(destination: systemLogDestination)

    let ansiColorLogFormatter = ANSIColorLogFormatter()
    ansiColorLogFormatter.colorize(level: .verbose, with: .cyan)
    ansiColorLogFormatter.colorize(level: .debug, with: .blue, options: [.bold])
    ansiColorLogFormatter.colorize(level: .warning, with: .yellow)
    ansiColorLogFormatter.colorize(level: .error, with: .red, options: [.bold])
    systemLogDestination.formatters = [ansiColorLogFormatter]

    let dateFormatter = DateFormatter()
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateStyle = .none
    dateFormatter.timeStyle = .medium
    log.dateFormatter = dateFormatter

    return log
}()
