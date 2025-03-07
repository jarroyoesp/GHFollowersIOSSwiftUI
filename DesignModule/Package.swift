// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignModule",
    platforms: [
            .iOS(.v16) // Cambia a .v17 si solo quieres iOS 17+
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DesignModule",
            targets: ["DesignModule"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DesignModule"),
        .testTarget(
            name: "DesignModuleTests",
            dependencies: ["DesignModule"]
        ),
    ]
)
