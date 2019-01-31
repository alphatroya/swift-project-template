import Foundation

enum ProjectConfiguration {
    case debug, `internal`, release

    static var current: ProjectConfiguration {
        #if DEBUG
            return .debug
        #elseif INTERNAL
            return .internal
        #else
            return .release
        #endif
    }
}
