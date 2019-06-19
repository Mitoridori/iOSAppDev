//
//  VBrickNode.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-11.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class VBrickNode: SKSpriteNode, EventListenerNode, InteractiveNode {
        var gameScene:GameScene?
        var dynBrick = false
    
    func didMoveToScene() {
        isUserInteractionEnabled = true
        physicsBody!.categoryBitMask = PhysicsCategory.Brick
        physicsBody!.collisionBitMask = PhysicsCategory.Player | PhysicsCategory.Brick
        physicsBody!.contactTestBitMask = PhysicsCategory.Brick | PhysicsCategory.Board
        dynBrick = false
        dynamicBrick()
        
    }
    
    func interact() {
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dynBrick = true
        dynamicBrick()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard touches.first != nil else {
            return
        }
        for touch in touches {
            let location = touch.location(in: self)
            
            let previousLocation = touch.previousLocation(in: self)
            
            let brickY = position.y + (location.y - previousLocation.y)
            
            position = CGPoint(x: position.x, y: brickY)
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        dynBrick = false
        dynamicBrick()
        gameScene?.counter()
        print("message Sent",  gameScene?.counter())
        interact()
    }
    
    func dynamicBrick(){
        if dynBrick == true{
            physicsBody?.pinned = false
        }
        else if dynBrick == false {
            physicsBody?.pinned = true
        }
    }
}
