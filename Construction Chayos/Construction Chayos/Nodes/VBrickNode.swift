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
    }
    
    func interact() {
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dynBrick = true
        
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
            
           // position.y = location.y
            
//            if location.y > 0{
//                run(SKAction.moveBy(x: 0, y: 1, duration: 0.1))
//            }else{
//                run(SKAction.moveBy(x: 0, y: -1, duration: 0.1))
//            }
//
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        dynBrick = false
        gameScene?.TotalMoves = gameScene!.TotalMoves + 1
        print("message Sent",  gameScene?.TotalMoves)
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
