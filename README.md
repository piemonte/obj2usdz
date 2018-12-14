# obj2usdz

Convert Wavefront .OBJ files to .USDZ from an iOS device in [Swift](https://developer.apple.com/swift/).

With the introduction of the [USDZ](https://graphics.pixar.com/usd/docs/Usdz-File-Format-Specification.html) format and iOS 12, Apple provided guidance only for creating `.usdz` files using their macOS commandline tool:

```sh
xcrun usdz_converter Tyrannosaurus.obj Tyrannosaurus.usdz 
- g TyrannosaurusMesh
-color_map Tyrannosaurus_Color.png
-metallic_map Tyrannosaurus_Metallic.png
-roughness_map Tyrannosaurus_Roughness.png
-normal_map .  Tyrannosaurus_Normal.png
-emissive_map  Tyrannosaurus_Emissive.png
```

Thanks to the discovery from the folks at [scandy](https://www.scandy.co/blog/how-to-export-simple-3d-objects-as-usdz-on-ios), there is a means to create USDZ files from iOS itself.

### Exporting to .USDZ

Copy the `MDLAsset+usdz.swift` file into your Xcode project.

```swift
let objAsset = MDLAsset(url: objUrl)

let destinationFileUrl = URL(fileURLWithPath: "path/Scene.usdz")
objAsset.exportToUSDZ(destinationFileUrl: destinationFileUrl)
```

## Resources

* [USDZ Specification](https://graphics.pixar.com/usd/docs/Usdz-File-Format-Specification.html)
* [Pixar’s USD project](https://github.com/PixarAnimationStudios/USD)
* [scandy blog](https://www.scandy.co/blog/how-to-export-simple-3d-objects-as-usdz-on-ios)

## License

`obj2usdz` is available under the MIT license, see the [LICENSE](https://github.com/piemonte/obj2usdz/blob/master/LICENSE) file for more information.