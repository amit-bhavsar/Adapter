// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Adapter",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Adapter",targets: ["Adapter"]),
    ],
    dependencies: [
            .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMinor(from: "5.4.3"))
    ],
    targets: [
        .target(
            name: "Adapter", path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)
