import UIKit

class ParentVC: UIViewController {
    private class ParentPopGestureRecognizerDelegate: NSObject, UIGestureRecognizerDelegate {
        @objc
        func gestureRecognizer(
            _: UIGestureRecognizer,
            shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer
        ) -> Bool {
            return true
        }
    }

    private let gestureHandler = ParentPopGestureRecognizerDelegate()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureStatusBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let navigationController = self.navigationController,
            let gestureRecognizer = navigationController.interactivePopGestureRecognizer {
            gestureRecognizer.delegate = gestureHandler
            gestureRecognizer.isEnabled = navigationController.viewControllers.count > 1
        }
    }

    deinit {
        log.debug("%{public}@ released 🙌", String(describing: type(of: self)))
    }
}

extension ParentVC: NavigationStatusBarConfigurator {}
