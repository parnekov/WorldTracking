//
//  ViewController.swift
//  WorldTracking
//
//  Created by user on 04.03.2021.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView?
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.sceneView?.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin];
        
        self.sceneView?.session.run(configuration);
        self.sceneView?.autoenablesDefaultLighting = true;
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: Any) {
        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06));
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        
        let boxNode = SCNNode();
        boxNode.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0);
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red

        
        let node = SCNNode();
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.darkGray
        node.position = SCNVector3(0.2, 0.3, -0.2);
//        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        
        let nodeCil = SCNNode();
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        nodeCil.geometry = SCNCylinder(radius: 0.1, height: 0.3)
        nodeCil.geometry?.firstMaterial?.specular.contents = UIColor.white
        nodeCil.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        nodeCil.position = SCNVector3(0.1, 0.1, -0.5);
        
  
        boxNode.position = SCNVector3(0, -0.05, 0);
        self.sceneView?.scene.rootNode.addChildNode(node);
        node.addChildNode(boxNode);
        
        doorNode.position = SCNVector3(0, -0.02, 0.051);
        boxNode.addChildNode(doorNode)
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession();
    }
    
    func restartSession(){
        self.sceneView?.session.pause(); // pause tracking
        self.sceneView?.scene.rootNode.enumerateChildNodes {(node, _) in
            node.removeFromParentNode();
        }
        self.sceneView?.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
     return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    
    
}

