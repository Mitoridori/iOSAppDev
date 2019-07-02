//
//  WinScreen.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-28.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit


class WinScreen: SKScene {
    
    var gameScene = GameScene()
    var movesTaken: SKLabelNode!
    var vara = Varaiables()
    
    override func didMove(to view: SKView){
        
        let playableArea = CGRect(x: -480, y: -480, width: 960, height: 960)
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableArea)
        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
            }
        })
        
        movesTakenLabel()
        
    }
    
    func movesTakenLabel() {
        
        movesTaken = SKLabelNode(fontNamed: "Chalkduster")
        movesTaken.text = "\(gameScene.TotalMoves)"
        movesTaken.fontSize = 72
        movesTaken.position = CGPoint(x: 72.486, y: -161.479)
        movesTaken.bringToFront()
        addChild(movesTaken)
        
    }
    
    func levelSelect() {
        
        let scene = SKScene(fileNamed: "LevelSelect")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
        
    }
    

    func newGame() {
        print ("newGame: ", vara.curtLevel)
        view!.presentScene(GameScene.level(levelNum: vara.curtLevel ))
    }
    

    func nextLevel(){
        var Nlvl = vara.curtLevel
                vara.getlevel()
      
        
        print ("Before lvl", Nlvl)
        if Nlvl <= 3 {
           Nlvl += 1
            print("New Level" , Nlvl)
        }
        //Make confetiee
        //gameScene?.transitionToScene(level: gameScene?.currentLevel ?? 1)
        //run(SKAction.afterDelay(0, runBlock: newGame))
        
    }
    
    func UnlockStars() {
        
        if (gameScene.currentLevel == 1) {
            
            if(gameScene.TotalMoves ?? 0 <= 7) {
                
                
                
            }
            
        } else if (gameScene.currentLevel == 2) {
            
            if(gameScene.TotalMoves <= 7) {
                
                
                
            }
            
        } else if(gameScene.currentLevel == 3) {
            
            
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "LevelSelect" {
                levelSelect()
            }
            else if name == "NextLvl"{
                nextLevel()
                
            }
        }
    }
    
}
