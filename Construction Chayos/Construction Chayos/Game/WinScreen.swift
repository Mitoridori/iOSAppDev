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
    var starOne: SKSpriteNode!
    var starTwo: SKSpriteNode!
    var starThree: SKSpriteNode!
    
    
    override func didMove(to view: SKView){
        
        let playableArea = CGRect(x: -480, y: -480, width: 960, height: 960)
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableArea)
        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
            }
        })
        
        starOne = childNode(withName: "starOne") as? SKSpriteNode
        starTwo = childNode(withName: "starTwo") as? SKSpriteNode
        starThree = childNode(withName: "starThree") as? SKSpriteNode
        
        
        movesTakenLabel()
        
    }
    
    func movesTakenLabel() {
        
        movesTaken = SKLabelNode(fontNamed: "Chalkduster")
        gameScene.saveTotalMoves()
        movesTaken.text = "\(gameScene.savedMoves + 1)"
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
        view!.presentScene(GameScene.level(levelNum: vara.curtLevel))

    }
    

    func nextLevel(){
        vara.getCurrentLvl()
        if vara.curtLevel == 3 {
            vara.SetLevel(i: 1)
        }
        else {
        vara.getlevel()
        }
        //Make confetiee
        run(SKAction.afterDelay(0, runBlock: newGame))
        
    }
    
    func UnlockStars() {
        
        if (vara.curtLevel == 1) {
            
            if(gameScene.TotalMoves  <= 10) {
                
                
                
            } else if(gameScene.TotalMoves > 10 && gameScene.TotalMoves <= 15) {
                
                
                
            } else {
                
                
            }
            
        } else if (vara.curtLevel == 2) {
            
            if(gameScene.TotalMoves <= 25) {
                
                
                
            } else if(gameScene.TotalMoves > 25 && gameScene.TotalMoves <= 30) {
                
                
                
            } else {
                
                
                
            }
            
        } else if(vara.curtLevel == 3) {
            
            if(gameScene.TotalMoves <= 21) {
                
                
                
            } else if(gameScene.TotalMoves > 21 && gameScene.TotalMoves <= 26) {
                
                
                
            } else {
                
                
                
            }
            
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
