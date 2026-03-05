import UIKit

public struct Spacer {
    
    @usableFromInline
    let length: CGFloat
    
    @inlinable
    public init() {
        self.length = UIView.noIntrinsicMetric
    }
    
    @inlinable
    public init(length: CGFloat) {
        self.length = length
    }
}

@usableFromInline
final class Sized: UIView {
    
    @usableFromInline
    let width: CGFloat
    @usableFromInline
    let height: CGFloat
    
    @usableFromInline
    init(width: CGFloat) {
        self.width = width
        self.height = UIView.noIntrinsicMetric
        super.init(frame: .zero)
    }
    
    @usableFromInline
    init(height: CGFloat) {
        self.width = UIView.noIntrinsicMetric
        self.height = height
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @inlinable
    override var intrinsicContentSize: CGSize {
        return CGSize(width: width, height: height)
    }
}

@usableFromInline
final class Unsized: UIView {}
