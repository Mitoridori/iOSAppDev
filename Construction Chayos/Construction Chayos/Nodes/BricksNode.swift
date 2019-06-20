//
//  bricks.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-11.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class BricksNode: BrickParent {

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard touches.first != nil else {
            return
        }
        for touch in touches {
            
            let location = touch.location(in: self)
            
            let previousLocation = touch.previousLocation(in: self)
            
            var brickX = position.x + (location.x - previousLocation.x)
            
            position = CGPoint(x: brickX, y: position.y)
            
        }
        
    }
    
}
