//
//  CustomShapeViewController.swift
//  SceneKit_shapes
//
//  Created by Mac Developer on 4/17/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit
import SceneKit

class CustomShapeViewController: UIViewController {

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
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 1))
        path.addLine(to: CGPoint(x: 1, y: 1))
        path.addLine(to: CGPoint(x: 2, y: 0))
        path.close()
        
        let shape = SCNShape(path: path, extrusionDepth: 2)
        
        let node = SCNNode()
        node.geometry = shape
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        scene.rootNode.addChildNode(node)
        //let action = SCNAction.rotate(by: 90 * CGFloat((.pi)/180.0), around: SCNVector3(1, 0, 0), duration: 3)
        //let repeatAction = SCNAction.repeatForever(action)
        //node.runAction(repeatAction)
    }

}
