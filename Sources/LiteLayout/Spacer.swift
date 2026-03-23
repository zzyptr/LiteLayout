import UIKit

public struct Spacer {
    
    let length: CGFloat
    
    @inline(__always)
    public init() {
        self.length = UIView.noIntrinsicMetric
    }
    
    @inline(__always)
    public init(length: CGFloat) {
        self.length = length
    }
}

final class Sized: UIView {
    
    let width: CGFloat
    let height: CGFloat
    
    @inline(__always)
    init(width: CGFloat) {
        self.width = width
        self.height = UIView.noIntrinsicMetric
        super.init(frame: .zero)
    }
    
    @inline(__always)
    init(height: CGFloat) {
        self.width = UIView.noIntrinsicMetric
        self.height = height
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    @inline(__always)
    override var intrinsicContentSize: CGSize {
        return CGSize(width: width, height: height)
    }
}

final class Unsized: UIView {}
