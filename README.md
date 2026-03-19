# Lite Layout

Lightweight Auto Layout syntactic sugar.

## Usage

### Stack-based APIs

#### 1. Declarative HStack & VStack inits
```swift
HStack(spacing: 8) {
    if hasTitle {
        makeTitle( ... )
    }
    if isHorizontal {
        HStack {
            for nth in 0..<100 {
                makeHorizontalCell( ... )
            } 
        }
    } else {
        VStack { ... }
    }
    makeFootnote( ... )
}
```

#### 2. Useful SwiftUI style Spacer
```swift
HStack {
    SomeLeftView( ... )
    Spacer(length: 8)
    SomeRightView( ... )
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

#### 3. Kotlin style apply function
```swift
VStack {
    UILabel().apply { this in
        this.text = "title"
        this.textColor = .red
    }
    Spacer(length: 8)
    UILabel().apply { this in
        this.text = "subtitle"
        this.textColor = .green
    }
}

```

### Anchor-based APIs

#### 1. Shorter constraint function names
```swift
// The same to leftView.topAnchor.constraint(equalTo: rightView.topAnchor).isActive = true
leftView.trailingAnchor.equalTo(rightView.leadingAnchor).activate()
// Set priority before activating
leftView.topAnchor.equalTo(rightView.topAnchor).activate(priority: .required)
```

#### 2. 2D Point & Size Anchors
```swift
// The same to leftView.topAnchor.equalTo(rightView.topAnchor).activate() & leftView.trailingAnchor.equalTo(rightView.leadingAnchor).activate() 
leftView.topTrailingAnchor.equalTo(rightView.topLeadingAnchor).activate()
```
