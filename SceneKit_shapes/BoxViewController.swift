//
//  BoxViewController.swift
//  SceneKit_shapes
//
//  Created by Mac Developer on 4/16/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit
import SceneKit

class BoxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createBox()
    }
    
    func createBox() {
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
        
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.backgroundColor = UIColor.lightGray
        sceneView.autoenablesDefaultLighting = true
        self.view.addSubview(sceneView)
        let box = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.1)
        let torus = SCNNode()
        torus.geometry = box
        torus.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        torus.geometry?.firstMaterial?.specular.contents = UIColor.white
        scene.rootNode.addChildNode(torus)
        let action = SCNAction.rotate(by: 90 * CGFloat((.pi)/180.0), around: SCNVector3(1, 0, 0), duration: 3)
        let repeatAction = SCNAction.repeatForever(action)
        torus.runAction(repeatAction)
    }
}
