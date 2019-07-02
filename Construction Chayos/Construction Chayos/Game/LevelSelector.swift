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
    var hello = 0
    
    func levelOne() {
        if let scene = GameScene.loadGame() ?? SKScene(fileNamed: "Level1") as? GameScene {
            scene.size = CGSize(width: size.width, height: size.height)
            scene.scaleMode = .aspectFit
            view!.presentScene(scene)
        }
        
    }
    func levelTwo() {
        if let scene = GameScene.loadGame() ?? SKScene(fileNamed: "Level2") as? GameScene {
            scene.size = CGSize(width: size.width, height: size.height)
            scene.scaleMode = .aspectFit
            view!.presentScene(scene)
        }
        
    }
    func levelThree() {
        if let scene = GameScene.loadGame() ?? SKScene(fileNamed: "Level3") as? GameScene {
            scene.size = CGSize(width: size.width, height: size.height)
            scene.scaleMode = .aspectFit
            view!.presentScene(scene)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "Level1" {
                levelOne()
                vara.SetLevel(i: 1)
                vara.getCurrentLvl()
            }
            if name == "Level2" {
                levelTwo()
                vara.SetLevel(i: 2)
                vara.getCurrentLvl()
            }
            if name == "Level3" {
                levelThree()
                vara.SetLevel(i: 3)
                vara.getCurrentLvl()
            }
        }
    }
    
}
