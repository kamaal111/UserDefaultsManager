// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserDefaultsManager",
    products: [
        .library(
            name: "UserDefaultsManager",
            targets: ["UserDefaultsManager"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UserDefaultsManager",
            dependencies: []),
        .testTarget(
            name: "UserDefaultsManagerTests",
            dependencies: ["UserDefaultsManager"]),
    ]
)
