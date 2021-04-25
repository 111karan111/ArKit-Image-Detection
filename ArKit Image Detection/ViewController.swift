//
//  ViewController.swift
//  ArKit Image Detection
//
//  Created by Karan Gandhi on 4/25/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true

        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        
        if let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
        
        configuration.trackingImages = referenceImages
        configuration.maximumNumberOfTrackedImages = 2
        print("Image succesfully added")
    
        }
        

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    
    
  //When image is detected
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        
        
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            let planeNode = SCNNode(geometry: plane)
            
            
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            
            
            if imageAnchor.referenceImage.name == "eevee-card"
            {
            if let pokeScene = SCNScene (named: "art.scnassets/eevee.scn"){
                
                
                if let pokeNode = pokeScene.rootNode.childNodes.first{
                    
                    
                    pokeNode.eulerAngles.x = .pi/2
                    
                    planeNode.addChildNode(pokeNode)
                }
            }
            
              
            
        }
            
            
            
            if imageAnchor.referenceImage.name == "oddish-card"
            {
            if let pokeScene = SCNScene (named: "art.scnassets/oddish.scn"){
                
                
                if let pokeNode = pokeScene.rootNode.childNodes.first{
                    
                    
                    pokeNode.eulerAngles.x = .pi/2
                    
                    planeNode.addChildNode(pokeNode)
                }
            }
            
              
            
        }
        return node
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
