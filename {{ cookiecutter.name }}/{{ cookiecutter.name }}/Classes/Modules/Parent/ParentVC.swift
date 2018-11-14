{{ cookiecutter.file_header }}

import UIKit

class ParentVC: UIViewController {
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

    private let gestureHandler = ParentPopGestureRecognizerDelegate()

    private class ParentPopGestureRecognizerDelegate: NSObject, UIGestureRecognizerDelegate {
        @objc
        func gestureRecognizer(
            _: UIGestureRecognizer,
            shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer
        ) -> Bool {
            return true
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

extension ParentVC: NavigationStatusBarConfigurator {}

protocol NavigationStatusBarConfigurator {
    func configureStatusBar()
}

extension NavigationStatusBarConfigurator where Self: UIViewController {
    func configureStatusBar() {
        switch preferredStatusBarStyle {
        case .lightContent:
            navigationController?.navigationBar.barStyle = .black
        default:
            navigationController?.navigationBar.barStyle = .default
        }
    }
}
