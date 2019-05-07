import UIKit

protocol Configurable {
    associatedtype Base
    var ex: Configuration<Self.Base> { get }
}

struct Configuration<Base> {
    let base: Base
}

extension Configurable {
    var ex: Configuration<Self> {
        return Configuration(base: self)
    }
}
