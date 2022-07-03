//
//  ViewController.swift
//  AR-Quest
//
//  Created by Madushan Senavirathna on 6/12/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var buttonView: UIView!
    
    var iphoneXnode: SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack  = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main){
            configuration.trackingImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 2
            print("Images Successfully Added")
        }
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor {
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
            
            if let iphoneXScene = SCNScene(named: "art.scnassets/iphone.scn"){
                
                let rotationAction = SCNAction.rotateBy(x: 0, y: 0, z: 0.5, duration: 1)
                let inifiniteAction = SCNAction.repeatForever(rotationAction)
                
                if let iphoneNode = iphoneXScene.rootNode.childNodes.first{
                    planeNode.addChildNode(iphoneNode)
                }
            }
            DispatchQueue.main.async {
                self.buttonView.isHidden = false
            }
            
        }
        return node
    }
    @IBAction func addCartBtn(_ sender: Any) {
        let cartViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "CartViewController")
        self.navigationController?.pushViewController(cartViewController, animated: true)
    }
    @IBAction func buyItNowBtn(_ sender: Any) {
        let paymentViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "PaymentViewController")
        self.navigationController?.pushViewController(paymentViewController, animated: true)
    }
    @IBAction func addCartDerectBtn(_ sender: Any) {
        let cartViewController = UIStoryboard.mainStoryboard().instantiateViewController(identifier: "CartViewController")
        self.navigationController?.pushViewController(cartViewController, animated: true)
    }
}
