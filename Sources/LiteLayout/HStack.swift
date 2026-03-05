import UIKit

public final class HStack: UIStackView {
    
    @inlinable
    public init(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        @XArrayBuilder arrangedSubviews: () -> [UIView]
    ) {
        super.init(frame: .zero)
        self.alignment = alignment
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var flexible: UIView?
        for subview in arrangedSubviews() {
            addArrangedSubview(subview)
            if subview is Unsized {
                flexible?.widthAnchor.equalTo(subview.widthAnchor).activate()
                flexible = subview
            }
        }
    }
    
    @inlinable
    public init(
        spacing: CGFloat,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        @ArrayBuilder arrangedSubviews: () -> [UIView]
    ) {
        super.init(frame: .zero)
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

    @inlinable
    public override var axis: NSLayoutConstraint.Axis {
        get {
            return .horizontal
        }
        @available(*, unavailable, message: "HStack always be horizontal")
        set {}
    }
    
    @available(*, unavailable, message: "This property is only used by vertical stack views")
    public override var isBaselineRelativeArrangement: Bool {
        get { return false }
        set {}
    }
}
