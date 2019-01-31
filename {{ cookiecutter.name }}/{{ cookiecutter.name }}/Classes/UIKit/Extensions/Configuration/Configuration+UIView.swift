import UIKit

extension UIView: Configurable {}

extension Configuration where Base: UIView {
    func prepareForAutoLayout() -> Base {
        base.translatesAutoresizingMaskIntoConstraints = false
        return base
    }

    @discardableResult
    func addAndFitEdges(to superview: UIView, andBindWith insets: UIEdgeInsets = UIEdgeInsets.zero) -> NSLayoutConstraint {
        base.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(base)
        let bottomConstraint = base.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom)
        bottomConstraint.priority = UILayoutPriority(999)
        let rightConstraint = base.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right)
        rightConstraint.priority = UILayoutPriority(999)
        NSLayoutConstraint.activate([
            base.topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
            bottomConstraint,
            base.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left),
            rightConstraint,
        ])
        return bottomConstraint
    }

    func center(in superview: UIView, xInset: CGFloat = 0, yInset: CGFloat = 0) {
        base.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(base)
        NSLayoutConstraint.activate([
            base.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: xInset),
            base.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: yInset),
        ])
    }
}
