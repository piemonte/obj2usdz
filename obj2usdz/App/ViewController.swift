//
//  ViewController.swift
//  obj2usdz
//
//  MIT License
//
//  Copyright (c) 2018-present patrick piemonte (http://patrickpiemonte.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit
import SceneKit
import SceneKit.ModelIO
import ModelIO

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sceneView = SCNView(frame: self.view.bounds)
        sceneView.allowsCameraControl = true
        sceneView.isPlaying = true
        sceneView.loops = true
        sceneView.backgroundColor = UIColor.white
        sceneView.defaultCameraController.interactionMode = .orbitTurntable
        sceneView.defaultCameraController.inertiaEnabled = true
        sceneView.scene = SCNScene()
        self.view.addSubview(sceneView)
        
        if let objUrl = Bundle.main.url(forResource: "RhinoExporter", withExtension: "obj") {
            let objAsset = MDLAsset(url: objUrl)
            let node = SCNNode(mdlObject: objAsset.object(at: 0))
            sceneView.scene?.rootNode.addChildNode(node)
        }
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.automaticallyAdjustsZRange = true
        cameraNode.camera?.fieldOfView = 35
        cameraNode.position = SCNVector3(x: 0, y: 100.0, z: 5.2)
        sceneView.scene?.rootNode.addChildNode(cameraNode)
        
    }

}
