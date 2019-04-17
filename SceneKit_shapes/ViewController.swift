//
//  ViewController.swift
//  SceneKit_shapes
//
//  Created by Mac Developer on 4/16/19.
//  Copyright © 2019 Viktoria. All rights reserved.
//

import UIKit
import SceneKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
        
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.backgroundColor = UIColor.lightGray
        sceneView.autoenablesDefaultLighting = false
        self.view.addSubview(sceneView)
        
        let torus = SCNNode()
        torus.geometry = SCNTorus(ringRadius: 1, pipeRadius: 0.5)
        torus.position = SCNVector3(0, 3, 0)
        torus.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        torus.geometry?.firstMaterial?.specular.contents = UIColor.white
        scene.rootNode.addChildNode(torus)
        
        let floor = SCNNode()
        
        floor.geometry = SCNFloor()
        floor.position = SCNVector3(0, 0, 0)
        scene.rootNode.addChildNode(floor)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 3, 10)
        scene.rootNode.addChildNode(cameraNode)
        sceneView.pointOfView = cameraNode
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = SCNLight.LightType.ambient
        scene.rootNode.addChildNode(ambientLightNode)
        
        let omnidirectionalLightNode = SCNNode()
        omnidirectionalLightNode.light = SCNLight()
        omnidirectionalLightNode.position = SCNVector3(0, 5, 10)
        omnidirectionalLightNode.light?.type = SCNLight.LightType.omni
        scene.rootNode.addChildNode(omnidirectionalLightNode)
        
        let spotLightNode = SCNNode()
        spotLightNode.light = SCNLight()
        spotLightNode.position = SCNVector3(0, 10, 0)
        spotLightNode.eulerAngles = SCNVector3(0 *  Float((Double.pi) / 180), 0 *  Float((Double.pi) / 180), 0 *  Float((Double.pi) / 180))
        spotLightNode.light?.type = SCNLight.LightType.spot
        scene.rootNode.addChildNode(spotLightNode)
        
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 5.0
        spotLightNode.position = SCNVector3(0, 15, 0)
        spotLightNode.eulerAngles = SCNVector3(-90 *  Float((Double.pi) / 180), 0 *  Float((Double.pi) / 180), 0 *  Float((Double.pi) / 180))
        
        SCNTransaction.commit()
        

    }


}

