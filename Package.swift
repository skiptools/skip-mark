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
        .package(url: "https://source.skip.tools/skip.git", from: "0.7.1"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.3.0"),
        .package(url: "https://source.skip.tools/skip-ffi.git", from: "0.0.0"),
        .package(url: "https://source.skip.tools/skip-cmark.git", branch: "gfm"),
    ],
    targets: [
    .target(name: "SkipMark", dependencies: [
        .product(name: "SkipFoundation", package: "skip-foundation"),
        .product(name: "SkipFFI", package: "skip-ffi"),
        .product(name: "cmark-gfm", package: "skip-cmark"),
    ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    .testTarget(name: "SkipMarkTests", dependencies: [
        "SkipMark",
        .product(name: "SkipTest", package: "skip")
    ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
