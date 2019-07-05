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
    
    func levels(name: String) {
        let scene = SKScene(fileNamed: name)
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
        
    }
    
    func loadLevel(name: String, i: Int) {
        
        levels(name: name)
        vara.SetLevel(i: i)
        gameScene.setSavedMoves(i: 0)
        vara.getCurrentLvl()
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "Level1" {
                loadLevel(name: "Level1", i: 1)
            }
            else if name == "Level2" {
                loadLevel(name: "Level2", i: 2)
            }
            else if name == "Level3" {
                loadLevel(name: "Level3", i: 3)
            }
            else if name == "Level4" {
                loadLevel(name: "Level4", i: 4)
            }
        }
    }
    
}
