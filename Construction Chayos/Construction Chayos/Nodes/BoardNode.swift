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
       
        let playableArea = CGRect(x: -480, y: -480, width: 960, height: 960)
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableArea)

        physicsBody!.categoryBitMask = PhysicsCategory.Board
        physicsBody!.collisionBitMask = PhysicsCategory.None

    }
    
    func interact() {
        
}

    

}
