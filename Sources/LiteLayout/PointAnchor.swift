import UIKit

public struct PointAnchor {
    @usableFromInline
    let x: NSLayoutXAxisAnchor
    @usableFromInline
    let y: NSLayoutYAxisAnchor
    
    @usableFromInline
    init(x: NSLayoutXAxisAnchor, y: NSLayoutYAxisAnchor) {
        self.x = x
        self.y = y
    }
}

public struct PointConstraint {
    
    public let x: NSLayoutConstraint
    public let y: NSLayoutConstraint

    @usableFromInline
    init(x: NSLayoutConstraint, y: NSLayoutConstraint) {
        self.x = x
        self.y = y
    }
    
    @inlinable
    @discardableResult
    public func activate() -> PointConstraint {
        x.isActive = true
        y.isActive = true
        return self
    }
    
    @inlinable
    @discardableResult
    public func activate(priority: UILayoutPriority) -> PointConstraint {
        x.priority = priority
        x.isActive = true
        y.priority = priority
        y.isActive = true
        return self
    }
}

extension PointAnchor {
    
    /// `self == anchor + plus`
    @inlinable
    public func equalTo(_ anchor: PointAnchor, plus: CGPoint = .zero) -> PointConstraint {
        return PointConstraint(
            x: x.equalTo(anchor.x, plus: plus.x),
            y: y.equalTo(anchor.y, plus: plus.y)
        )
    }
    
    /// `self >= anchor + plus`
    @inlinable
    public func greaterThanOrEqualTo(_ anchor: PointAnchor, plus: CGPoint = .zero) -> PointConstraint {
        return PointConstraint(
            x: x.greaterThanOrEqualTo(anchor.x, plus: plus.x),
            y: y.greaterThanOrEqualTo(anchor.y, plus: plus.y)
        )
    }
    
    /// `self <= anchor + plus`
    @inlinable
    public func lessThanOrEqualTo(_ anchor: PointAnchor, plus: CGPoint = .zero) -> PointConstraint {
        return PointConstraint(
            x: x.lessThanOrEqualTo(anchor.x, plus: plus.x),
            y: y.lessThanOrEqualTo(anchor.y, plus: plus.y)
        )
    }
    
    @inlinable
    func anchorWithOffset(to anchor: PointAnchor) -> SizeAnchor {
        return SizeAnchor(
            width: x.anchorWithOffset(to: anchor.x),
            height: y.anchorWithOffset(to: anchor.y)
        )
    }
}

extension UIView {
    
    @inlinable
    public var topLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: topAnchor)
    }
    
    @inlinable
    public var topTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: topAnchor)
    }
    
    @inlinable
    public var centerAnchor: PointAnchor {
        return PointAnchor(x: centerXAnchor, y: centerYAnchor)
    }
    
    @inlinable
    public var bottomTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: bottomAnchor)
    }
    
    @inlinable
    public var bottomLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: bottomAnchor)
    }
}

extension UILayoutGuide {
    
    @inlinable
    public var topLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: topAnchor)
    }
    
    @inlinable
    public var topTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: topAnchor)
    }
    
    @inlinable
    public var centerAnchor: PointAnchor {
        return PointAnchor(x: centerXAnchor, y: centerYAnchor)
    }
    
    @inlinable
    public var bottomTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: bottomAnchor)
    }
    
    @inlinable
    public var bottomLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: bottomAnchor)
    }
}

extension CGPoint {
    
    @inlinable
    public static func x(_ value: CGFloat) -> CGPoint {
        return CGPoint(x: value, y: 0)
    }
    
    @inlinable
    public static func y(_ value: CGFloat) -> CGPoint {
        return CGPoint(x: 0, y: value)
    }
}
