import UIKit

private let kHideKeyboardDelegate = HideKeyboardDelegate()

private class HideKeyboardDelegate: NSObject, UIGestureRecognizerDelegate {
    func gestureRecognizer(_: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view,
            view is UIButton else {
            return true
        }
        return false
    }
}

extension UIViewController {
    func addTapToHideKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = kHideKeyboardDelegate
        view.addGestureRecognizer(tapGesture)
    }
}

