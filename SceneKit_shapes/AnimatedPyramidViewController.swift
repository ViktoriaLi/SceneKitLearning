//
//  AnimatedPyramidViewController.swift
//  SceneKit_shapes
//
//  Created by Mac Developer on 4/17/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit
import SceneKit

class AnimatedPyramidViewController: UIViewController {

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
        
        let pyramid = SCNNode()

        pyramid.geometry = SCNPyramid(width: 1, height: 1, length: 1)
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        pyramid.geometry?.firstMaterial?.specular.contents = UIColor.white
        scene.rootNode.addChildNode(pyramid)
        
        let box = SCNNode()
        
        box.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        box.position = SCNVector3(0, -0.5, 0)
        box.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        pyramid.addChildNode(box)
        
        let floor = SCNNode()
        
        floor.geometry = SCNFloor()
        floor.position = SCNVector3(0, -1, 0)
        scene.rootNode.addChildNode(floor)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 10)
        scene.rootNode.addChildNode(cameraNode)
        sceneView.pointOfView = cameraNode
        
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 5.0
        //pyramid.position = SCNVector3(0, 1, -10)
        //pyramid.eulerAngles = SCNVector3(45 *  Float((Double.pi) / 180), 45 *  Float((Double.pi) / 180), 0 *  Float((Double.pi) / 180))
        cameraNode.position = SCNVector3(0, 5, 5)
        cameraNode.eulerAngles = SCNVector3(-45 *  Float((Double.pi) / 180), 0 *  Float((Double.pi) / 180), 0 *  Float((Double.pi) / 180))
        
        SCNTransaction.commit()
    }
}
