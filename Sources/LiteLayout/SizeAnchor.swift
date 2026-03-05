import UIKit

public struct SizeAnchor {
    @usableFromInline
    let width: NSLayoutDimension
    @usableFromInline
    let height: NSLayoutDimension
    
    @usableFromInline
    init(width: NSLayoutDimension, height: NSLayoutDimension) {
        self.width = width
        self.height = height
    }
}

public struct SizeConstraint {
    public let width: NSLayoutConstraint
    public let height: NSLayoutConstraint
    
    @usableFromInline
    init(width: NSLayoutConstraint, height: NSLayoutConstraint) {
        self.width = width
        self.height = height
    }
    
    @inlinable
    @discardableResult
    public func activate() -> SizeConstraint {
        width.isActive = true
        width.isActive = true
        return self
    }
    
    @inlinable
    @discardableResult
    public func activate(priority: UILayoutPriority) -> SizeConstraint {
        width.priority = priority
        height.priority = priority
        width.isActive = true
        height.isActive = true
        return self
    }
}

extension SizeAnchor {
    
    /// `self == constant`
    @inlinable
    public func equalTo(_ constant: CGSize) -> SizeConstraint {
        return SizeConstraint(
            width: width.equalTo(constant.width),
            height: height.equalTo(constant.height)
        )
    }
    
    /// `self >= constant`
    @inlinable
    public func greaterThanOrEqualTo(_ constant: CGSize) -> SizeConstraint {
        return SizeConstraint(
            width: width.greaterThanOrEqualTo(constant.width),
            height: height.greaterThanOrEqualTo(constant.height)
        )
    }
    
    /// `self <= constant`
    @inlinable
    public func lessThanOrEqualTo(_ constant: CGSize) -> SizeConstraint {
        return SizeConstraint(
            width: width.lessThanOrEqualTo(constant.width),
            height: height.lessThanOrEqualTo(constant.height)
        )
    }
    
    /// `self == anchor * times + plus`
    @inlinable
    public func equalTo(_ anchor: SizeAnchor, times: CGFloat = 1, plus: CGSize = .zero) -> SizeConstraint {
        return SizeConstraint(
            width: width.equalTo(anchor.width, times: times, plus: plus.width),
            height: height.equalTo(anchor.height, times: times, plus: plus.height),
        )
    }
    
    /// `self >= anchor * times + plus`
    @inlinable
    public func greaterThanOrEqualTo(_ anchor: SizeAnchor, times: CGFloat = 1, plus: CGSize = .zero) -> SizeConstraint {
        return SizeConstraint(
            width: width.greaterThanOrEqualTo(anchor.width, times: times, plus: plus.width),
            height: height.greaterThanOrEqualTo(anchor.height, times: times, plus: plus.height),
        )
    }
    
    /// `self <= anchor * times + plus`
    @inlinable
    public func lessThanOrEqualTo(_ anchor: SizeAnchor, times: CGFloat = 1, plus: CGSize = .zero) -> SizeConstraint {
        return SizeConstraint(
            width: width.lessThanOrEqualTo(anchor.width, times: times, plus: plus.width),
            height: height.lessThanOrEqualTo(anchor.height, times: times, plus: plus.height),
        )
    }
}

extension UIView {
    
    @inlinable
    public var sizeAnchor: SizeAnchor {
        return SizeAnchor(width: widthAnchor, height: heightAnchor)
    }
}

extension UILayoutGuide {
    
    @inlinable
    public var sizeAnchor: SizeAnchor {
        return SizeAnchor(width: widthAnchor, height: heightAnchor)
    }
}

extension CGSize {
    
    @inlinable
    public static func width(_ value: CGFloat) -> CGSize {
        return CGSize(width: value, height: 0)
    }
    
    @inlinable
    public static func height(_ value: CGFloat) -> CGSize {
        return CGSize(width: 0, height: value)
    }
}
