// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Needle",
    products: [
        .executable(name: "needle", targets: ["needle"]),
        .library(name: "NeedleFramework", targets: ["NeedleFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/SourceKitten.git", from: "0.23.1"),
        .package(url: "https://github.com/apple/swift-tools-support-core", .upToNextMajor(from: "0.1.5")),
        .package(url: "https://github.com/uber/swift-concurrency.git", .upToNextMajor(from: "0.6.5")),
        .package(url: "https://github.com/uber/swift-common.git", .exact("0.2.0")),
    ],
    targets: [
        .target(
            name: "NeedleFramework",
            dependencies: [
                "SwiftToolsSupport",
                "SourceKittenFramework",
                "Concurrency",
                "SourceParsingFramework",
            ]),
        .testTarget(
            name: "NeedleFrameworkTests",
            dependencies: ["NeedleFramework"],
            exclude: [
                "Fixtures",
            ]),
        .target(
            name: "needle",
            dependencies: [
                "NeedleFramework",
                "CommandFramework",
            ]),
    ],
    swiftLanguageVersions: [.v5]
)
