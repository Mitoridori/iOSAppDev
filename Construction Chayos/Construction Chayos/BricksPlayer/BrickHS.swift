//
//  Blocks.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-06.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit


class BrickHS: SKScene, EventListenerNode, InteractiveNode {
    func didMoveToScene(){
        isUserInteractionEnabled = true

        
    }

    func interact() {
//        isUserInteractionEnabled = false
//        run(SKAction.sequence([
//            SKAction.scale(to: 0.8, duration: 0.1),
//            SKAction.removeFromParent()
//            ]))
    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        print("destroy block")
//        //interact()
//    }
//    func fakeupdate(){
//        print("something")
//    }
    
}
    
    
    
//    func interact() {
//        isUserInteractionEnabled = false
//    }
//
//    func brickPhysicsH(){
//
//        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 320, height: 160))
//        physicsBody?.affectedByGravity = false
//        physicsBody?.allowsRotation = false
//
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        let location = touch!.location(in: self)
//        position.x = location.x
//        interact()
//    }
//
    
    
    
//}
