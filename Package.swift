// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RCSUI",
    defaultLocalization: "en",
    products: [
        .library(
            name: "RCSUI",
            targets: ["RCSUI"]),
    ],
    targets: [
        .target(
            name: "RCSUI"),
        .testTarget(
            name: "RCSUITests",
            dependencies: ["RCSUI"]
        ),
    ],
    swiftLanguageModes: [.v5]
)
