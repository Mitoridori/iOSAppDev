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
    static let VBrick: UInt32 = 1 << 3
    static let Board:   UInt32 = 1 << 4
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var playerNode:PlayerNode!
    var Moves: SKLabelNode!
    var Brick: SKSpriteNode!
    
    var bricksNode: BricksNode!
    var vbrickNode: VBrickNode!

    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    var TotalMoves = 0
    
    override func didMove(to view: SKView) {
         physicsWorld.contactDelegate = self
        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
                }
            })
        
        playerNode = childNode(withName: "Player") as? PlayerNode
        Moves = self.childNode(withName: "Moves") as? SKLabelNode
        Brick = self.childNode(withName: "Brick") as! SKSpriteNode
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == PhysicsCategory.Board | PhysicsCategory.VBrick {
            print ("V brick and board edge collision")
            }
        else if collision == PhysicsCategory.Board | PhysicsCategory.Brick {
            print ("Brick and board edge collision")
        } 
    }
    
    var velocity = CGPoint.zero
    var lastTouchLocation: CGPoint?
    var brickSpeed: CGFloat = 100
    
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        
        
        
        
        
        
//        let dt = CGFloat(currentTime - lastUpdateTime)
//        if let lastTouchLocation = lastTouchLocation {
//            let diff = lastTouchLocation - Brick.position
//            if diff.length() <= brickSpeed * CGFloat(dt) {
//                Brick.position = lastTouchLocation
//                velocity = CGPoint.zero
//            } else {
//              bricksNode.position = CGPoint(x: Brick.position.x + position.x + (position.x - Brick.position.x) * brickSpeed * dt, y: Brick.position.x + (position.y - Brick.position.y) * brickSpeed * dt)
//            }
//        }
        counter()
    }
    
    
    
    func newGame() {
        let scene = SKScene(fileNamed: "LevelOne")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFill
        view!.presentScene(scene)
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

    func getTotalMoves(){
        

    }
    
    func counter(){
       
        if TotalMoves == 0{
            //print ("No Change")
        }else{
            //Moves.text = "Moves: \(TotalMoves)"
            print(TotalMoves)
        }
    }

    
}

