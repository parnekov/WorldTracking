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
        // Do any additional setup after loading the view.
    }


}

