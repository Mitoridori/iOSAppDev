//
//  WonLevelViewController.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-18.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import UIKit
import SpriteKit

class WonLevelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "WinScreen") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                scene.size = CGSize(width: 1536, height: 2048)
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

}
