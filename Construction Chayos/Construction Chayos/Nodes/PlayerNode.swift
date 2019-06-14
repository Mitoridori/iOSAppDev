//
//  Player.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-06.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class PlayerNode: SKSpriteNode, EventListenerNode {
    func didMoveToScene() {
        isUserInteractionEnabled = true
        physicsBody!.categoryBitMask = PhysicsCategory.Player
        physicsBody!.collisionBitMask = PhysicsCategory.Brick; PhysicsCategory.VBrick
    }
    
    func interact() {
        
    }
    
 
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard touches.first != nil else {
            return
        }
        for touch in touches {
            let location = touch.location(in: self)
            
            let previousLocation = touch.previousLocation(in: self)
            
            let brickX = position.x + (location.x - previousLocation.x)
            
            position = CGPoint(x: brickX, y: position.y)
            
        }
        
    }
    
    
    public var MovesTakenP = 0
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        MovesTakenP = MovesTakenP + 1
        print(MovesTakenP)
    }
    

}
