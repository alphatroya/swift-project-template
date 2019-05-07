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
        return .default
    }

    deinit {
        log.verbose("\(String(describing: type(of: self))) released 🙌")
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
}

extension ParentVC: NavigationStatusBarConfigurator {}

