//
//  Player.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-06.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class PlayerNode: SKSpriteNode, EventListenerNode {
        var gameScene:GameScene?
        var dynBrick = false
    
    func didMoveToScene() {
        isUserInteractionEnabled = true
        physicsBody!.categoryBitMask = PhysicsCategory.Player
        physicsBody!.collisionBitMask = PhysicsCategory.Brick | PhysicsCategory.Board
        physicsBody!.contactTestBitMask = PhysicsCategory.Board
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
            
            let brickX = position.x + (location.x - previousLocation.x)
            
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
            physicsBody?.pinned = false
        }
        else if dynBrick == false {
            physicsBody?.pinned = true
        }
    }
    

}
