import UIKit

@resultBuilder
public class ArrayBuilder {
    
    @inline(__always)
    public static func buildBlock(_ components: [UIView]...) -> [UIView] {
        return components.reduce([], +)
    }
    
    @inline(__always)
    public static func buildExpression(_ expression: UIView) -> [UIView] {
        return [expression]
    }
    
    @inline(__always)
    public static func buildExpression(_ expression: [UIView]) -> [UIView] {
        return expression
    }
    
    @inline(__always)
    public static func buildOptional(_ component: [UIView]?) -> [UIView] {
        return component ?? []
    }

    @inline(__always)
    public static func buildEither(first component: [UIView]) -> [UIView] {
        return component
    }
    
    @inline(__always)
    public static func buildEither(second component: [UIView]) -> [UIView] {
        return component
    }
    
    @inline(__always)
    public static func buildArray(_ components: [[UIView]]) -> [UIView] {
        return components.reduce([], +)
    }

    @inline(__always)
    public static func buildLimitedAvailability(_ component: [UIView]) -> [UIView] {
        return component
    }
}

@resultBuilder
public final class XArrayBuilder: ArrayBuilder {
    
    @inline(__always)
    public static func buildExpression(_ expression: Spacer) -> [UIView] {
        if expression.length == UIView.noIntrinsicMetric {
            return [Unsized()]
        }
        return [Sized(width: expression.length)]
    }
}

@resultBuilder
public final class YArrayBuilder: ArrayBuilder {
    
    @inline(__always)
    public static func buildExpression(_ expression: Spacer) -> [UIView] {
        if expression.length == UIView.noIntrinsicMetric {
            return [Unsized()]
        }
        return [Sized(height: expression.length)]
    }
}
