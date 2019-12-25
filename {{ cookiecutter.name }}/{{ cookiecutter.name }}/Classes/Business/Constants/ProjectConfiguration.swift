import Foundation

enum ProjectConfiguration {
    case debug, release

    static var current: ProjectConfiguration {
        #if DEBUG
            return .debug
        #else
            return .release
        #endif
    }
}
