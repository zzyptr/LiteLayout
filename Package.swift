// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LiteLayout",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .visionOS(.v1),
        .macCatalyst(.v13),
    ],
    products: [
        .library(name: "LiteLayout", targets: ["LiteLayout"])
    ],
    targets: [
        .target(name: "LiteLayout"),
        .testTarget(name: "LiteLayoutTests", dependencies: ["LiteLayout"])
    ]
)
