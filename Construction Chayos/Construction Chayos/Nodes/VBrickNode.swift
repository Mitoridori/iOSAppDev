//
//  VBrickNode.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-11.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class VBrickNode: SKSpriteNode, EventListenerNode, InteractiveNode {
    
    func didMoveToScene() {
        isUserInteractionEnabled = true
        physicsBody!.categoryBitMask = PhysicsCategory.VBrick
        physicsBody!.collisionBitMask = PhysicsCategory.Player; PhysicsCategory.VBrick; PhysicsCategory.Brick
    }
    
    func interact() {
        
    }


    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            position.y = touchLocation.y
        }

        
        

    }

    public var MovesTakenV = 0
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        MovesTakenV = MovesTakenV + 1
        print(MovesTakenV)
    }

    
    
    
}
