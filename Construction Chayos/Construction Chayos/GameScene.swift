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
    
    func newGame() {
        let scene = SKScene(fileNamed: "LevelOne")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFill
        view!.presentScene(scene)
        //view!.presentScene(SKScene(fileNamed: "LevelOne"))
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "Reset" {
                newGame()
            }
        }
        
    }
    
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        print ("touch over")
//    }
    

    
}

