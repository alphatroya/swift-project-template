import UIKit

class LineView: UIView {
    enum LineAxis {
        case horizontal, vertical
    }

    static let separatorInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)

    private let axis: LineAxis

    @available(*, deprecated)
    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(axis: LineAxis, color: UIColor, thickness: CGFloat = 1) {
        self.axis = axis
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
        switch axis {
        case .horizontal:
            heightAnchor.constraint(equalToConstant: thickness).isActive = true
        case .vertical:
            widthAnchor.constraint(equalToConstant: thickness).isActive = true
        }
    }

    func placeAboveView(_ view: UIView, insets: UIEdgeInsets = .zero) {
        view.addSubview(self)
        switch axis {
        case .horizontal:
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
                rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right),
                topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            ])
        case .vertical:
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
                topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            ])
        }
    }

    func placeBelowView(_ view: UIView, insets: UIEdgeInsets = .zero) {
        view.addSubview(self)
        switch axis {
        case .horizontal:
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
                rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right),
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
            ])
        case .vertical:
            NSLayoutConstraint.activate([
                rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.left),
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
                topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            ])
        }
    }
}
