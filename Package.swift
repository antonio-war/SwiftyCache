// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyCache",
    products: [
        .library(
            name: "SwiftyCache",
            targets: ["SwiftyCache"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftyCache",
            dependencies: []),
        .testTarget(
            name: "SwiftyCacheTests",
            dependencies: ["SwiftyCache"]),
    ]
)
