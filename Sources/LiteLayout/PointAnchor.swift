import UIKit

public struct PointAnchor {
    
    let x: NSLayoutXAxisAnchor
    let y: NSLayoutYAxisAnchor
    
    @inline(__always)
    init(x: NSLayoutXAxisAnchor, y: NSLayoutYAxisAnchor) {
        self.x = x
        self.y = y
    }
}

public struct PointConstraint {
    
    public let x: NSLayoutConstraint
    public let y: NSLayoutConstraint

    @inline(__always)
    init(x: NSLayoutConstraint, y: NSLayoutConstraint) {
        self.x = x
        self.y = y
    }
    
    @inline(__always)
    @discardableResult
    public func activate(priority: UILayoutPriority = .required) -> PointConstraint {
        x.activate(priority: priority)
        y.activate(priority: priority)
        return self
    }
}

extension PointAnchor {
    
    /// `self == anchor + plus`
    @inline(__always)
    public func equalTo(_ anchor: PointAnchor, plus: CGPoint = .zero) -> PointConstraint {
        return PointConstraint(
            x: x.equalTo(anchor.x, plus: plus.x),
            y: y.equalTo(anchor.y, plus: plus.y)
        )
    }
    
    /// `self >= anchor + plus`
    @inline(__always)
    public func greaterThanOrEqualTo(_ anchor: PointAnchor, plus: CGPoint = .zero) -> PointConstraint {
        return PointConstraint(
            x: x.greaterThanOrEqualTo(anchor.x, plus: plus.x),
            y: y.greaterThanOrEqualTo(anchor.y, plus: plus.y)
        )
    }
    
    /// `self <= anchor + plus`
    @inline(__always)
    public func lessThanOrEqualTo(_ anchor: PointAnchor, plus: CGPoint = .zero) -> PointConstraint {
        return PointConstraint(
            x: x.lessThanOrEqualTo(anchor.x, plus: plus.x),
            y: y.lessThanOrEqualTo(anchor.y, plus: plus.y)
        )
    }
    
    @inline(__always)
    func anchorWithOffset(to anchor: PointAnchor) -> SizeAnchor {
        return SizeAnchor(
            width: x.anchorWithOffset(to: anchor.x),
            height: y.anchorWithOffset(to: anchor.y)
        )
    }
}

extension UIView {
    
    @inline(__always)
    public var topLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: topAnchor)
    }
    
    @inline(__always)
    public var topTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: topAnchor)
    }
    
    @inline(__always)
    public var centerAnchor: PointAnchor {
        return PointAnchor(x: centerXAnchor, y: centerYAnchor)
    }
    
    @inline(__always)
    public var bottomTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: bottomAnchor)
    }
    
    @inline(__always)
    public var bottomLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: bottomAnchor)
    }
}

extension UILayoutGuide {
    
    @inline(__always)
    public var topLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: topAnchor)
    }
    
    @inline(__always)
    public var topTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: topAnchor)
    }
    
    @inline(__always)
    public var centerAnchor: PointAnchor {
        return PointAnchor(x: centerXAnchor, y: centerYAnchor)
    }
    
    @inline(__always)
    public var bottomTrailingAnchor: PointAnchor {
        return PointAnchor(x: trailingAnchor, y: bottomAnchor)
    }
    
    @inline(__always)
    public var bottomLeadingAnchor: PointAnchor {
        return PointAnchor(x: leadingAnchor, y: bottomAnchor)
    }
}
