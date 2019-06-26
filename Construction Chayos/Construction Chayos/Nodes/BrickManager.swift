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
    
    override init(texture: SKTexture!, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func addMoves() {
            
        totalMoves = totalMoves + 1
        
        print("\(totalMoves)")
        
        
    }
    
}
