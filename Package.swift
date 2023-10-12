// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "kmp",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "tuist-kmp", targets: ["kmp"]),
    ],
    targets: [
        .target(
            name: "kmp"
        ),
    ]
)
