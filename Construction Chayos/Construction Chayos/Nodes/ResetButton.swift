//
//  ResetButton.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-12.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//


import SpriteKit

class ResetButton: SKSpriteNode, EventListenerNode, InteractiveNode  {
    var gameScene: GameScene!
    
    func didMoveToScene() {
   
    }
    
    func interact() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)



        print("Reset done")

    }
    

    
}
