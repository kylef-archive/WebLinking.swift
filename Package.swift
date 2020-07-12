// swift-tools-version:5.1
//
//  Package.swift
//

import PackageDescription

let package = Package(name: "WebLinking",
                      platforms: [.macOS(.v10_12),
                                  .iOS(.v8),
                                  .tvOS(.v9),
                                  .watchOS(.v2)],
                      products: [.library(name: "WebLinking",
                                          targets: ["WebLinking"])],
                      targets: [.target(name: "WebLinking",
                                        path: "Sources"),
                                .testTarget(name: "WebLinkingTests",
                                            dependencies: ["WebLinking"],
                                            path: "Tests")],
                      swiftLanguageVersions: [.v5])