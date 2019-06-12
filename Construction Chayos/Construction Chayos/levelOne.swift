//
//  levelOne.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-09.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import Foundation
import SpriteKit


class levelOne: SKScene, SKPhysicsContactDelegate  {
    
    //Physics categories
    let playerCategory:    UInt32 = 1 << 1
    let brickCategory:   UInt32 = 1 << 2
    let boardCategory:  UInt32 = 1 << 3
    
    var player = SKSpriteNode(imageNamed: "appicon")
    var LBOrange = SKSpriteNode(imageNamed: "Sidetile")
    var LBOrangeV = SKSpriteNode(imageNamed: "Sidetile")
    
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint( x:0.5, y:0.5)
        
        //background images
        backgroundColor = SKColor.gray
        let background = SKSpriteNode(imageNamed: "backgroundRocks")
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = -1
        background.scale(to: CGSize(width: 1536, height: 2048))
        addChild(background)

        let board = SKSpriteNode(imageNamed: "gridBG")
        board.position = CGPoint(x: 0, y: 0)
        board.scale(to: CGSize(width: 960, height: 960))
        board.physicsBody?.categoryBitMask = boardCategory
        board.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: -480, y: -480, width: 960, height: 960))
//        board.physicsBody?.friction = 0
//        board.physicsBody?.affectedByGravity = false
//        board.physicsBody?.allowsRotation = false
        board.physicsBody?.isDynamic = false
        addChild(board)

        
        
        //let player = SKSpriteNode (imageNamed: "appicon")
        player.anchorPoint = CGPoint( x:0, y:0)
        player.position = CGPoint(x: 0, y: 0)
        player.scale(to: CGSize(width: 320, height: 160))
        player.zPosition = 2
        player.name = "Player"
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 320, height: 160))
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.categoryBitMask = playerCategory
        //player.physicsBody?.isDynamic = false
        addChild(player)
        
        
        LBOrange.anchorPoint = CGPoint( x:0, y:0)
        LBOrange.position = CGPoint(x:-320, y: 0)
        LBOrange.scale(to: CGSize(width: 320, height: 160))
        LBOrange.name = "Orange"
        LBOrange.zPosition = 2
        LBOrange.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 320, height: 160))
        LBOrange.physicsBody?.affectedByGravity = false
        LBOrange.physicsBody?.allowsRotation = false
        //LBOrange.physicsBody?.isDynamic = false
        LBOrange.physicsBody?.categoryBitMask = brickCategory
        addChild(LBOrange)
        
        
        LBOrangeV.anchorPoint = CGPoint( x:0, y:0)
        LBOrangeV.position = CGPoint(x:-320, y: -160)
        LBOrangeV.scale(to: CGSize(width: 160, height: 160))
        LBOrangeV.name = "OrangeV"
        LBOrangeV.zPosition = 2
        LBOrangeV.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 320, height: 160))
        LBOrangeV.physicsBody?.affectedByGravity = false
        LBOrangeV.physicsBody?.allowsRotation = false
        //LBOrange.physicsBody?.isDynamic = false
        LBOrangeV.physicsBody?.categoryBitMask = brickCategory
        addChild(LBOrangeV)
        
        
        
    player.physicsBody?.collisionBitMask = brickCategory // player collides with nothing
    LBOrange.physicsBody?.collisionBitMask = brickCategory; playerCategory // brick collides with nothing
    board.physicsBody?.collisionBitMask = brickCategory; playerCategory
        
        
       deBugDrawPlayableArea()
    }
    
    func deBugDrawPlayableArea(){
        let shape = SKShapeNode(rect: CGRect(x: -480, y: -480, width: 960, height: 960))
        shape.position = CGPoint(x: 0, y: 0)
        shape.strokeColor = SKColor.red
        shape.lineWidth = 4.0
        addChild(shape)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        // 2
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        // 3
        if firstBody.categoryBitMask == playerCategory && secondBody.categoryBitMask == boardCategory {
            print("Hit bottom. First contact has been made.")
        }
    }

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        let location = touch!.location(in: self)
//        let touchedNode = self.atPoint(location)
//
//        if let name = touchedNode.name {
//            if name == "Player" {
//                player.position.x = location.x
//                //player.position.y = location.y
//            }
//            else if name == "Orange" {
//                LBOrange.position.x = location.x
//                //LBOrange.position.y = location.y
//            }
//        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch!.location(in: self)
        let touchedNode = self.atPoint(location)

        if let name = touchedNode.name {
            if name == "Player" {
                player.position.x = location.x
                //player.position.y = location.y
            }
            else if name == "Orange" {
                LBOrange.position.x = location.x
                //LBOrange.position.y = location.y
            }
            else if name == "OrangeV" {
                //LBOrangeV.position.x = location.x
                LBOrangeV.position.y = location.y
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch!.location(in: self)
        let touchedNode = self.atPoint(location)
        
        if let name = touchedNode.name {
            if name == "Player" {
                player.position = CGPoint(x: 160, y: 0)
            }
            else if name == "Orange" {
                LBOrange.position = CGPoint(x:-320, y: 0)
            }
            else if name == "OrangeV" {
                LBOrangeV.position = CGPoint(x:-320, y: -160)
            }
        }
        
    }
    
}
