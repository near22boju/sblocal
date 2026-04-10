// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "sblocal",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "SBLocal",
            targets: ["SBLocal"]
        ),
    ],
    targets: [
        .target(
            name: "SBLocal",
            path: "Sources/SBLocal",
            resources: [
                .process("Resources")
            ]        ),
        .testTarget(
            name: "SBLocalTests", dependencies: ["SBLocal"],
        ),
    ]
)
