import UIKit

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
