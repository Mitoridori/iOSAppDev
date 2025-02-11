//
//  BrickManager.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-25.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit


class BrickManager: SKSpriteNode {
    
    var totalMoves = 0
    var gameSceneChecker: GameScene? = nil
    
    
    override init(texture: SKTexture!, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //let bricks = childNode(withName: "Brick") as? SKSpriteNode
    }
    
    func addMoves() {
        
        totalMoves = totalMoves + 1
        gameSceneChecker?.setSavedMoves(i: totalMoves)

        print("\(totalMoves)")
        
        
    }
    
    func FindAllBricks(gameScene: GameScene)
    {
        gameSceneChecker = gameScene
        var i = 0
        gameScene.enumerateChildNodes(withName: "Brick")
        {
            node, stop in
            
            if let brick = node as? BrickParent {
                
                brick.brickManager = self
            }
            
            i += 1
        }
        
    }
    
}
