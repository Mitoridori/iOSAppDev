//
//  BoardNode.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-12.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//
import SpriteKit

class BoardNode: SKSpriteNode, EventListenerNode {
    func didMoveToScene() {
       isUserInteractionEnabled = true
        let playableArea = CGRect(x: -480, y: -480, width: 960, height: 960)
        parent!.physicsBody = SKPhysicsBody(edgeLoopFrom: playableArea)

        parent!.physicsBody!.categoryBitMask = PhysicsCategory.Board
        parent!.physicsBody!.collisionBitMask = PhysicsCategory.Brick | PhysicsCategory.Player
        
        parent!.physicsBody!.contactTestBitMask = PhysicsCategory.Brick

    }
    
    func interact() {
        
}

    

}
