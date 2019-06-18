//
//  bricks.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-11.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class BricksNode: SKSpriteNode, EventListenerNode, InteractiveNode {
    var gameScene:GameScene?
    var dynBrick = false
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
  
    func didMoveToScene() {
        isUserInteractionEnabled = true

        physicsBody!.categoryBitMask = PhysicsCategory.Brick
        physicsBody!.collisionBitMask = PhysicsCategory.Player | PhysicsCategory.Brick
        physicsBody!.contactTestBitMask = PhysicsCategory.Board | PhysicsCategory.Brick
        dynBrick = false
        dynamicBrick()
        
    }
    
    func interact() {
        
//        gameScene?.TotalMoves += 1
//        print("message Sent",  gameScene?.TotalMoves)
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

            var brickX = position.x + (location.x - previousLocation.x)

            position = CGPoint(x: brickX, y: position.y)

        }
        
    }
    

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        dynBrick = false
        dynamicBrick()
        gameScene?.TotalMoves = gameScene!.TotalMoves + 1
        print("message Sent",  gameScene?.TotalMoves)
        interact()
    }
    

    func dynamicBrick(){
        if dynBrick == true{
            physicsBody?.pinned = false // can move
        }
        else if dynBrick == false {
            physicsBody?.pinned = true //can not move
        }
        
        
    }
    
    func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        dynamicBrick()
    }
    
}
