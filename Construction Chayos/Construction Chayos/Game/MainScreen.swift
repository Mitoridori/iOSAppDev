//
//  MainScreen.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-19.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit


class MainScreen: SKScene {
    
    var hello = 0
    
    func playGame() {
        let scene = SKScene(fileNamed: "LevelSelect")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)

//        //Loads Information stored as a key (which is called hello) and stores in in the variable hello
//        hello = UserDefaults.standard.object(forKey: "hello") as! Int
//        hello += 1
//        //Saves Information passed in (hello, ) in key (forKey: "hello"
//        UserDefaults.standard.set(hello, forKey: "hello")
        
        if let name = touchedNode.name {
            if name == "Play" {
                playGame()
                
            } else if name == "Quit" {
                exit(0)
                
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
        
        //print(self)
    }
}
