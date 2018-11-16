{{ cookiecutter.file_header }}

import RxSwift
import UIKit

enum NavigationFlowControllerError: Error {
    case wrongRootViewController
}

final class NavigationFlowController {
    var rootViewController: UIViewController

    var childFlowControllers: [FlowController]?

    weak var parentFlowController: FlowController?

    init(rootViewController vc: UIViewController) {
        let navigationController = UINavigationController(rootViewController: vc)
        rootViewController = navigationController
    }
}

extension NavigationFlowController: FlowController {
    func performTransition(to viewController: UIViewController, animated: Bool = true) -> FlowControllerResult {
        if let childFlowController = self.childFlowControllers?.first {
            return childFlowController.performTransition(to: viewController, animated: animated)
        }
        return Observable.create { [unowned self] (observer: AnyObserver<UIViewController?>) in
            guard let navigationController = self.rootViewController as? UINavigationController else {
                observer.onError(NavigationFlowControllerError.wrongRootViewController)
                return Disposables.create()
            }
            viewController.hidesBottomBarWhenPushed = true
            navigationController.push(viewController: viewController, animated: animated) {
                observer.onNext(viewController)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    func performBackRootTransition(animated: Bool) -> FlowControllerResult {
        if let childFlowController = self.childFlowControllers?.first {
            return childFlowController.performBackTransition(animated: animated)
        }
        return Observable.create { [unowned self] (observer: AnyObserver<UIViewController?>) in
            guard let navigationController = self.rootViewController as? UINavigationController else {
                observer.onError(NavigationFlowControllerError.wrongRootViewController)
                return Disposables.create()
            }
            navigationController.popToRoot(animated: animated) {
                observer.onNext(nil)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    func performBackTransition(animated: Bool = true) -> FlowControllerResult {
        if let childFlowController = self.childFlowControllers?.first {
            return childFlowController.performBackTransition(animated: animated)
        }
        return Observable.create { [unowned self] (observer: AnyObserver<UIViewController?>) in
            guard let navigationController = self.rootViewController as? UINavigationController else {
                observer.onError(NavigationFlowControllerError.wrongRootViewController)
                return Disposables.create()
            }
            navigationController.pop(animated: animated) {
                observer.onNext(nil)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}

private extension UINavigationController {
    func push(viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        pushViewController(viewController, animated: animated)

        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }

    func pop(animated: Bool, completion: @escaping () -> Void) {
        popViewController(animated: animated)

        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }

    func popToRoot(animated: Bool, completion: @escaping () -> Void) {
        popToRootViewController(animated: animated)

        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}
