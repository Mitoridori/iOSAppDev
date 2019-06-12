//
//  GameScene.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-05-31.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

protocol EventListenerNode {
    func didMoveToScene()
    }

protocol InteractiveNode {
    func interact()
}

struct PhysicsCategory {
    static let None:  UInt32 = 0 << 0
    static let Player:   UInt32 = 1 << 1
    static let Brick: UInt32 = 1 << 2
    static let Board:   UInt32 = 1 << 4
    static let Edge:  UInt32 = 1 << 6
    static let VBrick: UInt32 = 1 << 3
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var playerNode:PlayerNode!
    
    var playable = true
    
    override func didMove(to view: SKView) {
        
        // Calculate playable margin
        let maxAspectRatio: CGFloat = 16.0/9.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
        let playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: size.height-playableMargin*2)
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        
        //Physic items
        physicsWorld.contactDelegate = self
        physicsBody!.categoryBitMask = PhysicsCategory.Edge
        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
                }
            })
        
        playerNode = childNode(withName: "Player") as? PlayerNode
        
        
        
 
    }
    
 
    
    
    
}

