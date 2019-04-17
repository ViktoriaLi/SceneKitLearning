//
//  PlanetViewController.swift
//  SceneKit_shapes
//
//  Created by Mac Developer on 4/17/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit
import SceneKit

class PlanetViewController: UIViewController {

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
        
        
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 1)
        node.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "difussion")
        node.geometry?.firstMaterial?.specular.contents = UIImage(named: "specular")
        node.geometry?.firstMaterial?.emission.contents = UIImage(named: "emission")
        node.geometry?.firstMaterial?.normal.contents = UIImage(named: "normal")
        node.geometry?.firstMaterial?.multiply.contents = UIColor.purple
        node.geometry?.firstMaterial?.transparency = 0.7
        node.geometry?.firstMaterial?.shininess = 1
        scene.rootNode.addChildNode(node)
        let action = SCNAction.rotate(by: 360 * CGFloat((.pi)/180.0), around: SCNVector3(0, 1, 0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        node.runAction(repeatAction)
    }
}
