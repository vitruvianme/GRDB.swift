// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRDB",
    platforms: [
        .iOS(v14),
        .macOS(v11),
        .tvOS(v13),
        .watchOS(v7),
    ],
    products: [
        .library(name: "GRDB", targets: ["GRDB"]),
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary(
            name: "CSQLite",
            providers: [.apt(["libsqlite3-dev"])]),
        .target(
            name: "GRDB",
            dependencies: ["CSQLite"],
            path: "GRDB"),
        .testTarget(
            name: "GRDBTests",
            dependencies: ["GRDB"],
            path: "Tests",
            exclude: [
                "CocoaPods",
                "CustomSQLite",
                "Crash",
                "Performance",
                "SPM",
            ])
    ],
    swiftLanguageVersions: [.v5]
)
