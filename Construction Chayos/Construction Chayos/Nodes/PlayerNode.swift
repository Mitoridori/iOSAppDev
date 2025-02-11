//
//  Player.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-06.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class PlayerNode: BrickParent {
 
    
    override init(texture: SKTexture!, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        posMod = CGPoint(x:1, y: 0)
    }
    
    override func didMoveToScene() {
        isUserInteractionEnabled = true
        physicsBody!.categoryBitMask = PhysicsCategory.Player
        physicsBody!.collisionBitMask = PhysicsCategory.Brick | PhysicsCategory.Board | PhysicsCategory.TrafficCone
        physicsBody!.contactTestBitMask = PhysicsCategory.TrafficCone
        pinBrick = false
        pinnedBrick()
    
    }
    
//    func addSmoke() {
//        let smoke = SKEmitterNode(fileNamed: "smoke.sks")!
//        smoke.zPosition = -1
//        smoke.targetNode = PlayerNode
//        smoke.numParticlesToEmit = 1
//        smoke.run(SKAction.removeFromParentAfterDelay(2.0))
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        dynBrick = true
//        dynamicBrick()
//        gameScreen.addSmoke()
//        
//    }

    
}
