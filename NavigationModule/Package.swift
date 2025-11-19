// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NavigationModule",
    platforms: [
        .iOS(.v16), // Cambia a .v17 si solo quieres iOS 17+
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NavigationModule",
            targets: ["NavigationModule"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.10.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NavigationModule",
            dependencies: [
                .product(name: "Swinject", package: "Swinject"),
            ]
        ),
    ]
)
