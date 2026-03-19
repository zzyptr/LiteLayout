import UIKit

public protocol Applyable {}

extension UIView: Applyable {}

extension Applyable where Self: UIView {
    
    @inline(__always)
    public func apply(_ closure: (_ this: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension CGSize {
    
    @inline(__always)
    public init(width: CGFloat) {
        self = CGSize(width: width, height: 0)
    }
    
    @inline(__always)
    public init(height: CGFloat) {
        self = CGSize(width: 0, height: height)
    }
}

extension CGPoint {
    
    @inline(__always)
    public init(x: CGFloat) {
        self = CGPoint(x: x, y: 0)
    }
    
    @inline(__always)
    public init(y: CGFloat) {
        self = CGPoint(x: 0, y: y)
    }
}
