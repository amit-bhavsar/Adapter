// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Adapter",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(name: "Adapter",targets: ["Adapter"]),
    ],
    dependencies: [
        .package(name: "Alamofire", url: "https://github.com/Alamofire/Alamofire.git", .upToNextMinor(from: "5.4.3"))
    ],
    targets: [
        .target(
            name: "Adapter", dependencies: ["Alamofire"], path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)
