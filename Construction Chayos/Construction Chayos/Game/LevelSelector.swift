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
    var truck: SKSpriteNode!
    var toggleAudioOnOff: SKSpriteNode!
    
    var truckSmoke = SKEmitterNode(fileNamed: "smoke.sks")!
    
    override func didMove(to view: SKView){

        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
            }
        })
        
        truck = childNode(withName: "truck") as? SKSpriteNode

        MoveTruck()
    }
    
    func smokeEmitter() {
        
        var emitterToAdd = truckSmoke.copy() as! SKEmitterNode
        
        emitterToAdd.position = truck.position
        let addEmitterAction = SKAction.run({self.addChild(emitterToAdd)})
        var emitterDuration = CGFloat(truckSmoke.numParticlesToEmit) * truckSmoke.particleLifetime
        let wait = SKAction.wait(forDuration: TimeInterval(emitterDuration))
        let remove = SKAction.run({emitterToAdd.removeFromParent(); print("Emitter Removed")})
        let sequence = SKAction.sequence([addEmitterAction, wait, remove])
        
        self.run(sequence)
        
    }

    func MoveTruck(){
        truck.run(SKAction.sequence([SKAction.run(smokeEmitter)]))
        truckSmoke.run(SKAction.sequence([SKAction.moveTo(x: truck.position.x - 580, duration: 3.0)]))
        truck.run(SKAction.sequence([SKAction.moveTo(x: truck.position.x - 580, duration: 3.0)]))

    }
    
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
                vara.SetLevel(i: 1)
                gameScene.setSavedMoves(i: 0)
                vara.getCurrentLvl()
            }
            else if name == "Level2" {
                levelTwo()
                vara.SetLevel(i: 2)
                gameScene.setSavedMoves(i: 0)
                vara.getCurrentLvl()
            }
            else if name == "Level3" {
                levelThree()
                vara.SetLevel(i: 3)
                gameScene.setSavedMoves(i: 0)
                vara.getCurrentLvl()
            }
            else if name == "Mute/unmute" {
                
                
                
            }
        }
    }
    
}
