import UIKit

public final class VStack: UIStackView {
    
    @inline(__always)
    public init(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        @YArrayBuilder arrangedSubviews: () -> [UIView]
    ) {
        super.init(frame: .zero)
        super.axis = .vertical
        self.alignment = alignment
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var flexible: UIView?
        for subview in arrangedSubviews() {
            addArrangedSubview(subview)
            if subview is Unsized {
                flexible?.heightAnchor.equalTo(subview.heightAnchor).activate()
                flexible = subview
            }
        }
    }
    
    @inline(__always)
    public init(
        spacing: CGFloat,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        @ArrayBuilder arrangedSubviews: () -> [UIView]
    ) {
        super.init(frame: .zero)
        super.axis = .vertical
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
        
        for subview in arrangedSubviews() {
            addArrangedSubview(subview)
        }
    }
    
    @available(*, unavailable)
    public required init(coder: NSCoder) {
        fatalError()
    }
    
    @inline(__always)
    public override var axis: NSLayoutConstraint.Axis {
        get {
            return .vertical
        }
        @available(*, unavailable, message: "VStack always be vertical")
        set {}
    }
}
