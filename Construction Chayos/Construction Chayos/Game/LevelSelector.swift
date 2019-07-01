//
//  LevelSelector.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-06.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class LevelSelector: SKScene {
    var gameScene = GameScene()
    var vara = Varaiables()
    
    func levelOne() {
        let scene = SKScene(fileNamed: "Level1")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
        
    }
    func levelTwo() {
        let scene = SKScene(fileNamed: "Level2")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
        
    }
    func levelThree() {
        let scene = SKScene(fileNamed: "Level3")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "Level1" {
                levelOne()
                gameScene.currentLevel = 1
                vara.curtLevel = 1
            }
            if name == "Level2" {
                levelTwo()
                gameScene.currentLevel = 2
                vara.curtLevel = 2
            }
            if name == "Level3" {
                levelThree()
                gameScene.currentLevel = 3
                vara.curtLevel = 3
            }
        }
    }
    
}
