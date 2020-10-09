# obj2usdz

Create .USDZ files from iOS itself in [Swift](https://developer.apple.com/swift/).

## Note

Since WWDC19, it's now possible to write usdz files natively using SceneKit. (thanks @cpheinrich)

This repo shared an older technique prior to it's more recent recommended method:

```swift
import SceneKit
import ModelIO

let asset = MDLAsset(url: objPath)
let scene = SCNScene(mdlAsset: asset)
scene.write(to: <your-usdz-file-path>, delegate: nil)
```

• [Recommended at WWDC19](https://developer.apple.com/videos/play/wwdc2019/602/)

## Previous Technique

With the introduction of the [USDZ](https://graphics.pixar.com/usd/docs/Usdz-File-Format-Specification.html) format and iOS 12, Apple provided guidance only for creating `.usdz` files using their macOS commandline tool:

```sh
xcrun usdz_converter Tyrannosaurus.obj Tyrannosaurus.usdz 
-g TyrannosaurusMesh
-color_map Tyrannosaurus_Color.png
-metallic_map Tyrannosaurus_Metallic.png
-roughness_map Tyrannosaurus_Roughness.png
-normal_map .  Tyrannosaurus_Normal.png
-emissive_map  Tyrannosaurus_Emissive.png
```

### Exporting to .USDZ

Copy the `MDLAsset+usdz.swift` file into your Xcode project and create .USDZ in the following way:

```swift
let objAsset = MDLAsset(url: objUrl)

let destinationFileUrl = URL(fileURLWithPath: "path/Scene.usdz")
objAsset.exportToUSDZ(destinationFileUrl: destinationFileUrl)
```

## Resources

* [USDZ Specification](https://graphics.pixar.com/usd/docs/Usdz-File-Format-Specification.html)
* [Pixar’s USD project](https://github.com/PixarAnimationStudios/USD)
* [scandy blog](https://www.scandy.co/blog/how-to-export-simple-3d-objects-as-usdz-on-ios)
* [BlenderUSDZ](https://github.com/robmcrosby/BlenderUSDZ.git)
* [USDPython](https://developer.apple.com/download/more/?=USDPython), Python based tools for generating, validating, and creating USD files.

## License

`obj2usdz` is available under the MIT license, see the [LICENSE](https://github.com/piemonte/obj2usdz/blob/master/LICENSE) file for more information.
