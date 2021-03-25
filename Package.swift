// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "docker-client-vapor-demo",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
//        .package(url: "https://github.com/alexsteinerde/docker-client-swift.git", .branch("main")),
        .package(name: "docker-client-swift", path: "/Users/alex/Developer/vapor4-beta/docker-client-swift"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "DockerClientSwift", package: "docker-client-swift"),
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .target(name: "Run", dependencies: [.target(name: "App")]),
    ]
)
