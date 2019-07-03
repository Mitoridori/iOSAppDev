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
    var congratsLabel: SKLabelNode!
    var congratsMessage: SKLabelNode!
    var vara = Varaiables()
    var starOne: SKSpriteNode!
    var starTwo: SKSpriteNode!
    var starThree: SKSpriteNode!
    
    
    let sparkEmitter = SKEmitterNode(fileNamed: "WinningSparks.sks")!
    
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
        UnlockStars()
        
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
    
    func congratulationLabel() {
        
        congratsLabel = SKLabelNode(fontNamed: "Chalkduster")
        congratsLabel.text = "Woo!"
        congratsLabel.fontSize = 72
        congratsLabel.position = CGPoint(x: -223.156, y: -313)
        congratsLabel.bringToFront()
        addChild(congratsLabel)
        
    }
    
    func congratulationMessage() {
        
        congratsMessage = SKLabelNode(fontNamed: "Chalkduster")
        congratsMessage.text = "PERFECT SCORE!"
        congratsMessage.fontSize = 40
        congratsMessage.position = CGPoint(x: 100, y: -300)
        congratsMessage.bringToFront()
        addChild(congratsMessage)
        
    }
    
    func bestMoves() {
        
        congratulationLabel()
        congratulationMessage()
        
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
    
    func sparkParticles(position: CGPoint) {
        
        var emitterToAdd = sparkEmitter.copy() as! SKEmitterNode
        
        emitterToAdd.position = position
        let addEmitterAction = SKAction.run({self.addChild(emitterToAdd)})
        var emitterDuration = CGFloat(sparkEmitter.numParticlesToEmit) * sparkEmitter.particleLifetime
        let wait = SKAction.wait(forDuration: TimeInterval(emitterDuration))
        let remove = SKAction.run({emitterToAdd.removeFromParent(); print("Emitter Removed")})
        let sequence = SKAction.sequence([addEmitterAction, wait, remove])
        
        self.run(sequence)
        
    }
    
    func UnlockStars() {
        
        let locationOne = starOne.position
        let locationTwo = starTwo.position
        let locationThree = starThree.position
        
        switch vara.getCurrentLvl() {
            
        case 1:
            if((gameScene.savedMoves + 1)  <= 10) {
                
                self.sparkParticles(position: locationOne)
                self.sparkParticles(position: locationTwo)
                self.sparkParticles(position: locationThree)
                bestMoves()
                
            } else if((gameScene.savedMoves + 1) > 10 && (gameScene.savedMoves + 1) <= 15) {
                
                starThree.isHidden = true
                self.sparkParticles(position: locationOne)
                self.sparkParticles(position: locationTwo)
                
            } else {
                
                starTwo.isHidden = true
                starThree.isHidden = true
                self.sparkParticles(position: locationOne)
                
            }
            break
            
        case 2:
            if((gameScene.savedMoves + 1) <= 25) {
                    
                self.sparkParticles(position: locationOne)
                self.sparkParticles(position: locationTwo)
                self.sparkParticles(position: locationThree)
                bestMoves()

            } else if((gameScene.savedMoves + 1) > 25 && (gameScene.savedMoves + 1) <= 30) {
                    
                starThree.isHidden = true
                self.sparkParticles(position: locationOne)
                self.sparkParticles(position: locationTwo)
                    
            } else {
                    
                starTwo.isHidden = true
                starThree.isHidden = true
                self.sparkParticles(position: locationOne)
                    
            }
            break
            
        case 3:
            if((gameScene.savedMoves + 1) <= 21) {
                
                self.sparkParticles(position: locationOne)
                self.sparkParticles(position: locationTwo)
                self.sparkParticles(position: locationThree)
                bestMoves()
                
            } else if((gameScene.savedMoves + 1) > 21 && (gameScene.savedMoves + 1) <= 26) {
                
                starThree.isHidden = true
                self.sparkParticles(position: locationOne)
                self.sparkParticles(position: locationTwo)
                
            } else {
                
                starTwo.isHidden = true
                starThree.isHidden = true
                self.sparkParticles(position: locationOne)
                
            }
            break
            
        default:
            break
            
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
