// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "skip-mark",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipMark", type: .dynamic, targets: ["SkipMark"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.8.19"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.5.11"),
        .package(url: "https://source.skip.tools/skip-ffi.git", from: "0.3.2"),
        .package(url: "https://source.skip.tools/skip-unit.git", from: "0.6.1"),
    ],
    targets: [
        .target(name: "SkipMark", dependencies: [
            "LibCMark",
            .product(name: "SkipFoundation", package: "skip-foundation"),
            .product(name: "SkipFFI", package: "skip-ffi"),
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipMarkTests", dependencies: [
            "SkipMark",
            .product(name: "SkipTest", package: "skip")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "LibCMark", dependencies: [
            .product(name: "SkipUnit", package: "skip-unit")
        ], exclude: [
            "src/scanners.re",
            "src/libcmark-gfm.pc.in",
            "src/entities.inc",
            "src/case_fold_switch.inc",
            "src/CMakeLists.txt",
        ],
        sources: ["src"],
        publicHeadersPath: "src/include",
        cSettings: [
            .headerSearchPath("src/include"),
            .define("CMARK_THREADING"),
        ],
        plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
