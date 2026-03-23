import UIKit

extension NSLayoutConstraint {
    
    @inline(__always)
    @discardableResult
    public func activate(priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        if let view = firstItem as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        if let view = secondItem as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        self.priority = priority
        self.isActive = true
        return self
    }
}

extension NSLayoutXAxisAnchor {
    
    /// `self == anchor + plus`
    @inline(__always)
    public func equalTo(_ anchor: NSLayoutXAxisAnchor, plus: CGFloat = 0) -> NSLayoutConstraint {
        return constraint(equalTo: anchor, constant: plus)
    }
    
    /// `self >= anchor + plus`
    @inline(__always)
    public func greaterThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, plus: CGFloat = 0) -> NSLayoutConstraint {
        return constraint(greaterThanOrEqualTo: anchor, constant: plus)
    }
    
    /// `self <= anchor + plus`
    @inline(__always)
    public func lessThanOrEqualTo(_ anchor: NSLayoutXAxisAnchor, plus: CGFloat = 0) -> NSLayoutConstraint {
        return constraint(lessThanOrEqualTo: anchor, constant: plus)
    }
}

extension NSLayoutYAxisAnchor {
    
    /// `self == anchor + plus`
    @inline(__always)
    public func equalTo(_ anchor: NSLayoutYAxisAnchor, plus: CGFloat = 0) -> NSLayoutConstraint {   
        return constraint(equalTo: anchor, constant: plus)
    }
    
    /// `self >= anchor + plus`
    @inline(__always)
    public func greaterThanOrEqualTo(_ anchor: NSLayoutYAxisAnchor, plus: CGFloat = 0) -> NSLayoutConstraint {
        return constraint(greaterThanOrEqualTo: anchor, constant: plus)
    }
    
    /// `self <= anchor + plus`
    @inline(__always)
    public func lessThanOrEqualTo(_ anchor: NSLayoutYAxisAnchor, plus: CGFloat = 0) -> NSLayoutConstraint {
        return constraint(lessThanOrEqualTo: anchor, constant: plus)
    }
}

extension NSLayoutDimension {
    
    /// `self == constant`
    @inline(__always)
    public func equalTo(_ constant: CGFloat) -> NSLayoutConstraint {
        return constraint(equalToConstant: constant)
    }
    
    /// `self >= constant`
    @inline(__always)
    public func greaterThanOrEqualTo(_ constant: CGFloat) -> NSLayoutConstraint {
        return constraint(greaterThanOrEqualToConstant: constant)
    }
    
    /// `self <= constant`
    @inline(__always)
    public func lessThanOrEqualTo(_ constant: CGFloat) -> NSLayoutConstraint {
        return constraint(lessThanOrEqualToConstant: constant)
    }
    
    /// `self == anchor * times + plus`
    @inline(__always)
    public func equalTo(_ anchor: NSLayoutDimension, times: CGFloat = 1, plus: CGFloat = 0) -> NSLayoutConstraint {
        return constraint(equalTo: anchor, multiplier: times, constant: plus)
    }
    
    /// `self >= anchor * times + plus`
    @inline(__always)
    public func greaterThanOrEqualTo(_ anchor: NSLayoutDimension, times: CGFloat = 1, plus: CGFloat = 0) -> NSLayoutConstraint {
        return constraint(greaterThanOrEqualTo: anchor, multiplier: times, constant: plus)
    }
    
    /// `self <= anchor * times + plus`
    @inline(__always)
    public func lessThanOrEqualTo(_ anchor: NSLayoutDimension, times: CGFloat = 1, plus: CGFloat = 0) -> NSLayoutConstraint {
        return constraint(lessThanOrEqualTo: anchor, multiplier: times, constant: plus)
    }
}
