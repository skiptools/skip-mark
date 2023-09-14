// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "skip-mark",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
    .library(name: "SkipMark", targets: ["SkipMark"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.6.57"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.1.16"),
    ],
    targets: [
    .target(name: "SkipMark", dependencies: [.product(name: "SkipFoundation", package: "skip-foundation"))], plugins: [.plugin(name: "skipstone", package: "skip")]),
    .testTarget(name: "SkipMarkTests", dependencies: [
        "SkipMark",
        .product(name: "SkipTest", package: "skip"))
    ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
