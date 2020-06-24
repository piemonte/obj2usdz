// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "obj2usdz",
    platforms: [
      .iOS(.v12)
    ],
    products: [
      .library(name: "obj2usdz", targets: ["obj2usdz"])
    ],
    targets: [
      .target(
          name: "obj2usdz",
          path: "Sources"
      )
    ],
    swiftLanguageVersions: [.v5]
)
