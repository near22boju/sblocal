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
    dependencies: [
        .package(path: "../sbdomain"), // Local
//        .package(url: "https://github.com/near22boju/sbdomain.git", from: "0.0.01"), // Remote
    ],
    targets: [
        .target(
            name: "SBLocal",
            dependencies: [
                .product(name: "SBDomain", package: "sbdomain"),
           ],
            path: "Sources/SBLocal",
            resources: [
                .process("Resources")
            ]        ),
        .testTarget(
            name: "SBLocalTests",
            dependencies: [
                "SBLocal",
                .product(name: "SBDomain", package: "sbdomain")
            ]
        ),
    ]
)
