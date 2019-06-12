//
//  Player.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-06.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class PlayerNode: SKSpriteNode, EventListenerNode {
    func didMoveToScene() {
        print ("I'm a player!")
    }

}
