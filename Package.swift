// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "airthings-server",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .executable(name: "main", targets: ["main"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .executableTarget(name: "main", dependencies: [
            .product(name: "Vapor", package: "vapor")
        ]),
    ]
)