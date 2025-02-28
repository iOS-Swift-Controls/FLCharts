// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FLCharts",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "FLCharts",
            targets: ["FLCharts"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FLCharts",
            dependencies: []),
    ],
    swiftLanguageVersions: [.v5]
)
