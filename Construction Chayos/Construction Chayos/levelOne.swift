//
//  levelOne.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-09.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import Foundation
import SpriteKit


class levelOne: SKScene {
    
    var player = SKSpriteNode(imageNamed: "appicon")
    var LBOrange = SKSpriteNode(imageNamed: "Sidetile")
    
    override func didMove(to view: SKView) {
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
//        board.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x:0, y:0, width: 960, height: 960) )
//        board.physicsBody?.friction = 0
//        board.physicsBody?.affectedByGravity = false
//        board.physicsBody?.allowsRotation = false
//        board.physicsBody?.isDynamic = false
        addChild(board)
        
        //let player = SKSpriteNode (imageNamed: "appicon")
        player.anchorPoint = CGPoint( x:0, y:0)
        player.position = CGPoint(x: 160, y: 0)
        player.scale(to: CGSize(width: 320, height: 160))
        player.zPosition = 2
        player.name = "Player"
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 320, height: 160))
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.allowsRotation = false
        addChild(player)
        
        
        LBOrange.anchorPoint = CGPoint( x:0, y:0)
        LBOrange.position = CGPoint(x:-400, y: 0)
        LBOrange.scale(to: CGSize(width: 320, height: 160))
        LBOrange.name = "Orange"
        LBOrange.zPosition = 2
        LBOrange.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 320, height: 160))
        LBOrange.physicsBody?.affectedByGravity = false
        LBOrange.physicsBody?.allowsRotation = false
        addChild(LBOrange)
        
        
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
                LBOrange.position = CGPoint(x:-480, y: 320)
            }
        }
        
    }
    
}
