import UIKit

class ParentVC: UIViewController {
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

    deinit {
        print("%{public}@ released 🙌", String(describing: type(of: self)))
    }
}

extension ParentVC: NavigationStatusBarConfigurator {}
