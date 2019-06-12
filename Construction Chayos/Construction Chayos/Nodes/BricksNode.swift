//
//  bricks.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-11.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class BricksNode: SKSpriteNode, EventListenerNode, InteractiveNode {

    func didMoveToScene() {
        isUserInteractionEnabled = true
    }
    
    func interact() {
    
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first
        let location = touch!.location(in: self)
        
        position.x = location.x
        
        print("brick Moves")
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print ("touch over")
    }
    
}
