// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "NeedleFoundation",
    products: [
        .library(name: "NeedleFoundation", targets: ["NeedleFoundation"]),
        .library(name: "NeedleFoundationTest", targets: ["NeedleFoundationTest"]),
        .executable(name: "needle", targets: ["needle"]),
        .library(name: "NeedleFramework", targets: ["NeedleFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-tools-support-core", .upToNextMajor(from: "0.1.5")),
        .package(url: "https://github.com/uber/swift-concurrency.git", .upToNextMajor(from: "0.6.5")),
        .package(url: "https://github.com/uber/swift-common.git", .exact("0.4.0")),
        .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50200.0")),
    ],
    targets: [
        .target(
            name: "NeedleFoundation",
            dependencies: []),
        .testTarget(
            name: "NeedleFoundationTests",
            dependencies: ["NeedleFoundation"],
            exclude: []),
        .target(
            name: "NeedleFoundationTest",
            dependencies: ["NeedleFoundation"]),
        .testTarget(
            name: "NeedleFoundationTestTests",
            dependencies: ["NeedleFoundationTest"],
            exclude: []),
        .target(
            name: "NeedleFramework",
            dependencies: [
                "SwiftToolsSupport-auto",
                "Concurrency",
                "SourceParsingFramework",
                "SwiftSyntax",
            ]
        ),
//        .testTarget(
//            name: "NeedleFrameworkTests",
//            dependencies: ["NeedleFramework"],
//            exclude: [
//                "Fixtures",
//            ]),
        .target(
            name: "needle",
            dependencies: [
                "NeedleFramework",
                "CommandFramework",
            ]),
    ],
    swiftLanguageVersions: [.v5]
)
