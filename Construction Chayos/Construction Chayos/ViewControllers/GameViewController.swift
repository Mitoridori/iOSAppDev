//
//  GameViewController.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-05-31.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//
import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var CurLvl: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "MainScreen") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                scene.size = CGSize(width: 1536, height: 2048)
                //scene.currentGameViewController = self as? GameScene
                // Present the scene
                view.presentScene(scene)
            }
        
            view.showsPhysics = true
            view.ignoresSiblingOrder = false
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
}
