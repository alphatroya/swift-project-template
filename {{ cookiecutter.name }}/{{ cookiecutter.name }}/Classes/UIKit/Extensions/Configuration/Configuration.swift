{{ cookiecutter.file_header }}

import UIKit

struct Configuration<Base> {
    let base: Base
}

protocol Configurable {
    associatedtype Base
    var ex: Configuration<Self.Base> { get }
}

extension Configurable {
    var ex: Configuration<Self> {
        return Configuration(base: self)
    }
}
