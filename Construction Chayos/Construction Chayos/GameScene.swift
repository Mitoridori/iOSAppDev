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
    static let None:     UInt32 = 0 << 0
    static let Player:   UInt32 = 1 << 1
    static let Brick:    UInt32 = 1 << 2
    //static let VBrick: UInt32 = 1 << 3
    static let Board:    UInt32 = 1 << 4
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var playerNode:PlayerNode!
    var Brick: SKSpriteNode!
    
    var bricksNode: BricksNode!
    var vbrickNode: VBrickNode!

    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    var TotalMoves = 0
    var movesMade: SKLabelNode?
    
    override func didMove(to view: SKView) {
         physicsWorld.contactDelegate = self
        

        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
                }
            })
        
        playerNode = childNode(withName: "Player") as? PlayerNode
        Brick = self.childNode(withName: "Brick") as! SKSpriteNode
        movesMade = childNode(withName: "moves") as? SKLabelNode
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == PhysicsCategory.Player | PhysicsCategory.Board {
            didWin()
            print("SUCCESS")}
        if collision == PhysicsCategory.Brick | PhysicsCategory.Board {
            print ("Brick and board edge collision")}
        if collision == PhysicsCategory.Brick | PhysicsCategory.Brick {
            print ("Bricks have collision") }

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
        counter()
    }
    
    
    
    func newGame() {
        let scene = SKScene(fileNamed: "LevelOne")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
    }
    
    func didWin() {
        let scene = SKScene(fileNamed: "WinScreen")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "Reset" {
                newGame()
                TotalMoves = 0
            }
            else if name == "LevelSelect" {
                
            }
        }
    }

    func getTotalMoves(){
        

    }
    
    func counter(){
       
        movesMade?.text = "\(TotalMoves)"
        
    }

    
}

