# Lite Layout

Lightweight Auto Layout syntactic sugar.

## Usage

### Stack-based APIs

#### 1. Declarative HStack & VStack inits
```swift
HStack(alignment: .fill) {
    SomeView( ... )
    VStack {
        SomeView( ... )
        SomeView( ... )
    }
}
```

#### 2. Useful Spacer
```swift
HStack {
    Spacer(length: 8)
    SomeView( ... )
}

HStack {
    SomeLeftView( ... )
    Spacer()
}

HStack {
    Spacer()
    SomeCenterView( ... )
    Spacer()
}
```

### Anchor-based APIs

#### 1. Shorter function names
```swift
leftView.topAnchor.equalTo(rightView.topAnchor).activate(priority: .required)
leftView.trailingAnchor.equalTo(rightView.leadingAnchor).activate()
```

#### 2. Point & Size Anchors
```swift
leftView.topTrailingAnchor.equalTo(rightView.topLeadingAnchor).activate()
```
