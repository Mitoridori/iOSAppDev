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
         super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            position.y = touchLocation.y
        }

    }
//    var lastTouchTime = Date.timeIntervalSinceReferenceDate
//    var lastTouchPosition = CGPoint.zero
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesMoved(touches, with: event)
//        let currentTime = Date().timeIntervalSinceReferenceDate
//        let timeDelta = currentTime - lastTouchTime
//
//
//        for touch in touches{
//            removeAction(forKey: "TouchPrediction")
//
//            let oldPosition = lastTouchPosition
//            let positionInScreen = touch.location(in: self)
//            lastTouchPosition = positionInScreen
//
//            position.y = positionInScreen.y
//
//
//            //Calculate the difference between the sprite's last position and its current position,
//            //and use it to predict the sprite's position next frame.
//            let positionDelta = CGPoint(x: positionInScreen.x, y: positionInScreen.y - oldPosition.y)
//            let predictedPosition = CGPoint(x: positionInScreen.x, y: positionInScreen.y + positionDelta.y)
//
//            //Multiply the timeDelta by 1.5.  This helps to smooth out the lag,
//            //but making this number too high cause the animation to be ineffective.
//            run(SKAction.move(to: predictedPosition, duration: timeDelta * 1.5), withKey: "TouchPrediction")
//        }
//
//
//        lastTouchTime = Date().timeIntervalSinceReferenceDate
//    }
//
    
    
}
