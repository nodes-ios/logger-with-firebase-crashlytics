// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoggerWithFirebaseCrashlytics",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LoggerWithFirebaseCrashlytics",
            targets: ["LoggerWithFirebaseCrashlytics"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.21.0"),
        .package(url: "https://github.com/nodes-ios/logger.git", from: "0.1.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LoggerWithFirebaseCrashlytics",
            dependencies: [
                .product(name: "Logger", package: "logger"),
                .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk"),
            ],
            resources: []),
        .testTarget(
            name: "logger-with-firebase-crashlyticsTests",
            dependencies: ["LoggerWithFirebaseCrashlytics"]),
    ]
)
