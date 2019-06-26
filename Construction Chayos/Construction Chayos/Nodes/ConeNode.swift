//
//  ConeNode.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-25.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class ConeNode: SKSpriteNode, EventListenerNode {
    func didMoveToScene() {
        isUserInteractionEnabled = true
        
        physicsBody!.categoryBitMask = PhysicsCategory.TrafficCone
        physicsBody!.collisionBitMask = PhysicsCategory.Player
        physicsBody!.contactTestBitMask = PhysicsCategory.Player
        
    }
    
    func interact() {
        
    }
    
}
