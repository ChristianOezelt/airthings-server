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
            .package(url: "https://github.com/alexsteinerde/graphql-kit.git", from: "2.3.0"),
            .package(url: "https://github.com/alexsteinerde/graphiql-vapor.git", from: "2.0.0"),

        ],
        targets: [
            .executableTarget(name: "main", dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "GraphQLKit", package: "graphql-kit"),
                .product(name: "GraphiQLVapor", package: "graphiql-vapor"),

            ]),
        ]
)
