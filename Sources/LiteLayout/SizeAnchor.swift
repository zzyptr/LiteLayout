import UIKit

public struct SizeAnchor {
    
    let width: NSLayoutDimension
    let height: NSLayoutDimension
    
    @inline(__always)
    init(width: NSLayoutDimension, height: NSLayoutDimension) {
        self.width = width
        self.height = height
    }
}

public struct SizeConstraint {
    public let width: NSLayoutConstraint
    public let height: NSLayoutConstraint
    
    @inline(__always)
    init(width: NSLayoutConstraint, height: NSLayoutConstraint) {
        self.width = width
        self.height = height
    }
    
    @inline(__always)
    @discardableResult
    public func activate(priority: UILayoutPriority = .required) -> SizeConstraint {
        width.activate(priority: priority)
        height.activate(priority: priority)
        return self
    }
}

extension SizeAnchor {
    
    /// `self == constant`
    @inline(__always)
    public func equalTo(_ constant: CGSize) -> SizeConstraint {
        return SizeConstraint(
            width: width.equalTo(constant.width),
            height: height.equalTo(constant.height)
        )
    }
    
    /// `self >= constant`
    @inline(__always)
    public func greaterThanOrEqualTo(_ constant: CGSize) -> SizeConstraint {
        return SizeConstraint(
            width: width.greaterThanOrEqualTo(constant.width),
            height: height.greaterThanOrEqualTo(constant.height)
        )
    }
    
    /// `self <= constant`
    @inline(__always)
    public func lessThanOrEqualTo(_ constant: CGSize) -> SizeConstraint {
        return SizeConstraint(
            width: width.lessThanOrEqualTo(constant.width),
            height: height.lessThanOrEqualTo(constant.height)
        )
    }
    
    /// `self == anchor * times + plus`
    @inline(__always)
    public func equalTo(_ anchor: SizeAnchor, times: CGFloat = 1, plus: CGSize = .zero) -> SizeConstraint {
        return SizeConstraint(
            width: width.equalTo(anchor.width, times: times, plus: plus.width),
            height: height.equalTo(anchor.height, times: times, plus: plus.height),
        )
    }
    
    /// `self >= anchor * times + plus`
    @inline(__always)
    public func greaterThanOrEqualTo(_ anchor: SizeAnchor, times: CGFloat = 1, plus: CGSize = .zero) -> SizeConstraint {
        return SizeConstraint(
            width: width.greaterThanOrEqualTo(anchor.width, times: times, plus: plus.width),
            height: height.greaterThanOrEqualTo(anchor.height, times: times, plus: plus.height),
        )
    }
    
    /// `self <= anchor * times + plus`
    @inline(__always)
    public func lessThanOrEqualTo(_ anchor: SizeAnchor, times: CGFloat = 1, plus: CGSize = .zero) -> SizeConstraint {
        return SizeConstraint(
            width: width.lessThanOrEqualTo(anchor.width, times: times, plus: plus.width),
            height: height.lessThanOrEqualTo(anchor.height, times: times, plus: plus.height),
        )
    }
}

extension UIView {
    
    @inline(__always)
    public var sizeAnchor: SizeAnchor {
        return SizeAnchor(width: widthAnchor, height: heightAnchor)
    }
}

extension UILayoutGuide {
    
    @inline(__always)
    public var sizeAnchor: SizeAnchor {
        return SizeAnchor(width: widthAnchor, height: heightAnchor)
    }
}
