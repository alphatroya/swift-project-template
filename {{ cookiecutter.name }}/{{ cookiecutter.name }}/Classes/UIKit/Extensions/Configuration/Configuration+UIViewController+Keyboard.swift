import UIKit

private let kHideKeyboardDelegate = HideKeyboardDelegate()

extension Configuration where Base: UIViewController {
    func addTapToHideKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: base.view, action: #selector(base.view.endEditing))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = kHideKeyboardDelegate
        base.view.addGestureRecognizer(tapGesture)
    }
}

private class HideKeyboardDelegate: NSObject, UIGestureRecognizerDelegate {
    func gestureRecognizer(_: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view,
            view is UIButton else {
            return true
        }
        return false
    }
}
