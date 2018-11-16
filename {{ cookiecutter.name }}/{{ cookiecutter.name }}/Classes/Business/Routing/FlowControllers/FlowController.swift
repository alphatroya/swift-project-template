{{ cookiecutter.file_header }}

import RxSwift
import UIKit

typealias FlowControllerResult = Observable<UIViewController?>

protocol FlowController: class {
    var rootViewController: UIViewController { get }

    var childFlowControllers: [FlowController]? { get set }

    var parentFlowController: FlowController? { get set }

    func performTransition(to viewController: UIViewController, animated: Bool) -> FlowControllerResult

    func performBackTransition(animated: Bool) -> FlowControllerResult

    func performBackRootTransition(animated: Bool) -> FlowControllerResult

    func present(childFlowController: FlowController, animated: Bool) -> FlowControllerResult

    func presentRoot(childFlowController: FlowController, animated: Bool) -> FlowControllerResult

    func dismissChildFlowController(animated: Bool) -> FlowControllerResult
}

extension FlowController {
    func presentRoot(childFlowController: FlowController, animated: Bool) -> FlowControllerResult {
        return present(childFlowController: childFlowController, animated: animated)
    }

    func present(childFlowController: FlowController, animated: Bool = true) -> FlowControllerResult {
        if let presentedFlowController = self.childFlowControllers?.first {
            return presentedFlowController.present(childFlowController: childFlowController, animated: animated)
        }
        return Observable.create { [unowned self] (observer: AnyObserver<UIViewController?>) in
            self.childFlowControllers = [childFlowController]
            childFlowController.parentFlowController = self
            self.rootViewController.present(childFlowController.rootViewController, animated: animated) {
                observer.onNext(childFlowController.rootViewController)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    func dismissChildFlowController(animated: Bool = true) -> FlowControllerResult {
        if let presentedFlowController = self.childFlowControllers?.first {
            return presentedFlowController.dismissChildFlowController(animated: animated)
        }
        return Observable.create { [unowned self] (observer: AnyObserver<UIViewController?>) in
            guard let parentFlowController = self.parentFlowController else {
                observer.onNext(nil)
                observer.onCompleted()
                return Disposables.create()
            }
            parentFlowController.rootViewController.dismiss(animated: animated) {
                parentFlowController.childFlowControllers = nil
                observer.onNext(nil)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
