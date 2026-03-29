# skip-mark

Placeholder for future SkipMark module for [Skip](https://skip.dev) apps.


## Setup

To include this framework in your project, add the following
dependency to your `Package.swift` file:

```swift
let package = Package(
    name: "my-package",
    products: [
        .library(name: "MyProduct", targets: ["MyTarget"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.dev/skip-mark.git", "0.0.0"..<"2.0.0"),
    ],
    targets: [
        .target(name: "MyTarget", dependencies: [
            .product(name: "SkipMark", package: "skip-mark")
        ])
    ]
)
```

## License

This software is licensed under the 
[Mozilla Public License 2.0](https://www.mozilla.org/MPL/).
