//
//  BrickParent.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-20.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class BrickParent: SKSpriteNode, EventListenerNode, InteractiveNode {
    
    var dynBrick = false
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    var didTouch = false
    var posMod = CGPoint(x: 1, y: 0)
    var brickManager:BrickManager? = nil
    var isMoved: Bool = false
    
    override init(texture: SKTexture!, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    func didMoveToScene() {
        isUserInteractionEnabled = true
        
        physicsBody!.categoryBitMask = PhysicsCategory.Brick
        physicsBody!.collisionBitMask = PhysicsCategory.Player | PhysicsCategory.Brick
        physicsBody!.contactTestBitMask = PhysicsCategory.Board | PhysicsCategory.Brick
        dynBrick = false
        dynamicBrick()
        
    }
    
    func interact() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dynBrick = true
        dynamicBrick()
        isMoved = false
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if isGamePaused() {
            return
            
        }
        guard touches.first != nil else {
            return
        }
        for touch in touches {
            
            let location = touch.location(in: self)

            let previousLocation = touch.previousLocation(in: self)

            if(location != previousLocation) {
                
                isMoved = true
            }
            
            position = position + ((location - previousLocation) * posMod)
            
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if isGamePaused() {
            return
            
        }
        dynBrick = false
        didTouch = true
        dynamicBrick()
        if(isMoved == true) {
            
            if (brickManager != nil) {
                brickManager?.addMoves()
                
            }
            isMoved = false
        }
    }
    
    func isGamePaused() -> Bool {
        
        return brickManager?.gameSceneChecker?.isPaused ?? false
        
    }
    
    func dynamicBrick(){
        if dynBrick == true{
            physicsBody?.pinned = false // can move
        }
        else if dynBrick == false {
            physicsBody?.pinned = true //can not move
        }
        
        
    }
    
    func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        dynamicBrick()
    }
    
}
