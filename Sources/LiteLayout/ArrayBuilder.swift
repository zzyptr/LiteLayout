import UIKit

@resultBuilder
public class ArrayBuilder {
    
    @inlinable
    public static func buildBlock(_ components: [UIView]...) -> [UIView] {
        return components.reduce([], +)
    }
    
    @inlinable
    public static func buildExpression(_ expression: UIView) -> [UIView] {
        return [expression]
    }
    
    @inlinable
    public static func buildExpression(_ expression: [UIView]) -> [UIView] {
        return expression
    }
    
    @inlinable
    public static func buildOptional(_ component: [UIView]?) -> [UIView] {
        return component ?? []
    }

    @inlinable
    public static func buildEither(first component: [UIView]) -> [UIView] {
        return component
    }
    
    @inlinable
    public static func buildEither(second component: [UIView]) -> [UIView] {
        return component
    }
    
    @inlinable
    public static func buildArray(_ components: [[UIView]]) -> [UIView] {
        return components.reduce([], +)
    }

    @inlinable
    public static func buildLimitedAvailability(_ component: [UIView]) -> [UIView] {
        return component
    }
}

@resultBuilder
public final class XArrayBuilder: ArrayBuilder {
    
    @inlinable
    public static func buildExpression(_ expression: Spacer) -> [UIView] {
        if expression.length == UIView.noIntrinsicMetric {
            return [Unsized()]
        }
        return [Sized(width: expression.length)]
    }
}

@resultBuilder
public final class YArrayBuilder: ArrayBuilder {
    
    @inlinable
    public static func buildExpression(_ expression: Spacer) -> [UIView] {
        if expression.length == UIView.noIntrinsicMetric {
            return [Unsized()]
        }
        return [Sized(height: expression.length)]
    }
}
