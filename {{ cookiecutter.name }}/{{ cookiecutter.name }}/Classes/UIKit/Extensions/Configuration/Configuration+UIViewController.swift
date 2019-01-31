import UIKit

extension UIViewController: Configurable {}

extension Configuration where Base: UIViewController {
    @discardableResult
    func addAndFitEdges(_ subview: UIView, andBindWith insets: UIEdgeInsets = UIEdgeInsets.zero, fixToTop: Bool = true)
        -> NSLayoutConstraint {
        subview.translatesAutoresizingMaskIntoConstraints = false
        base.view.addSubview(subview)

        let topConstraint = fixToTop ?
            subview.topAnchor.constraint(equalTo: topEdgeAnchor, constant: insets.top) :
            subview.topAnchor.constraint(greaterThanOrEqualTo: topEdgeAnchor, constant: insets.top)
        let bottomConstraint = subview.bottomAnchor.constraint(equalTo: bottomEdgeAnchor, constant: -insets.bottom)
        bottomConstraint.priority = UILayoutPriority(rawValue: 999)
        let rightConstraint = subview.rightAnchor.constraint(equalTo: base.view.rightAnchor, constant: -insets.right)
        rightConstraint.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([
            topConstraint,
            bottomConstraint,
            subview.leftAnchor.constraint(equalTo: base.view.leftAnchor, constant: insets.left),
            rightConstraint,
        ])
        return bottomConstraint
    }

    private var topEdgeAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return base.view.safeAreaLayoutGuide.topAnchor
        } else {
            return base.topLayoutGuide.bottomAnchor
        }
    }

    private var bottomEdgeAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return base.view.safeAreaLayoutGuide.bottomAnchor
        } else {
            return base.bottomLayoutGuide.topAnchor
        }
    }
}
