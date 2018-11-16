{{ cookiecutter.file_header }}

import RxCocoa
import RxSwift
import UIKit

final class PlainFlowController {
    private let disposeBag = DisposeBag()

    let rootViewController: UIViewController

    var childFlowControllers: [FlowController]?

    weak var parentFlowController: FlowController?

    init(rootViewController vc: UIViewController) {
        rootViewController = vc
        configureDismiss()
    }

    private func configureDismiss() {
        let parentFlowController = self.parentFlowController
        rootViewController.rx.didDismissed
            .subscribe(onNext: { _ in
                parentFlowController?.childFlowControllers = nil
            })
            .disposed(by: disposeBag)
    }
}

extension PlainFlowController: FlowController {
    func performTransition(to viewController: UIViewController, animated: Bool = true) -> FlowControllerResult {
        if let childFlowController = self.childFlowControllers?.first {
            return childFlowController.performTransition(to: viewController, animated: animated)
        }
        return Observable.empty()
    }

    func performBackRootTransition(animated: Bool) -> FlowControllerResult {
        if let childFlowController = self.childFlowControllers?.first {
            return childFlowController.performBackTransition(animated: animated)
        }
        return Observable.empty()
    }

    func performBackTransition(animated: Bool = true) -> FlowControllerResult {
        if let childFlowController = self.childFlowControllers?.first {
            return childFlowController.performBackTransition(animated: animated)
        }
        return Observable.empty()
    }
}

extension Reactive where Base: UIViewController {
    var viewWillDisappear: ControlEvent<Bool> {
        let source = methodInvoked(#selector(Base.viewWillDisappear)).map { $0.first as? Bool ?? false }
        return ControlEvent(events: source)
    }

    var didDismissed: Observable<UIViewController> {
        return viewWillDisappear
            .filter { _ in
                self.base.isBeingDismissed || self.base.isMovingFromParent
            }
            .flatMap { _ -> Observable<UIViewController> in
                Observable.create { (observer: AnyObserver<UIViewController>) in
                    guard let coordinator = self.base.transitionCoordinator else {
                        observer.onCompleted()
                        return Disposables.create()
                    }

                    coordinator.animate(alongsideTransition: nil) { _ in
                        observer.onNext(self.base)
                        observer.onCompleted()
                    }

                    return Disposables.create()
                }
            }
    }
}
