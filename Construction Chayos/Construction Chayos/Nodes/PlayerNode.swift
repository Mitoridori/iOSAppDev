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
    
}
