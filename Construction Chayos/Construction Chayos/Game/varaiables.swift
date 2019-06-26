//
//  varaiables.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-25.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class Varaiables: SKScene{
    
    var gameScene = GameScene()
    public var curtLevel: Int = 1
    
    func getlevel() {
        
        curtLevel += 1
        
        //return curtLevel
        
    }
    
//    func didWin() {
//        print (currentLevel)
//        let scene = SKScene(fileNamed: "WinScreen")
//        scene?.size = CGSize(width: size.width, height: size.height)
//        scene?.scaleMode = .aspectFit
//        view!.presentScene(scene)
//    }
//
//    func levelSelect() {
//
//        let scene = SKScene(fileNamed: "LevelSelect")
//        scene?.size = CGSize(width: size.width, height: size.height)
//        scene?.scaleMode = .aspectFit
//        view!.presentScene(scene)
//
//    }
//
//    func nextLevel(){
//        print (currentLevel)
//        if currentLevel <= 3 {
//            currentLevel += 1
//            print (currentLevel)
//        }
//        //Make confetiee
//        run(SKAction.afterDelay(0, runBlock: gameScene.newGame))
//
//    }
//    class func level(levelNum: Int) -> GameScene? {
//        let scene = GameScene(fileNamed: "Level\(levelNum)")!
//        scene.vara.currentLevel = levelNum
//        scene.scaleMode = .aspectFit
//        return scene
//    }
    
}

