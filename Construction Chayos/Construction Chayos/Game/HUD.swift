//
//  HUD.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-07-01.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class HUD: SKNode {

    func updateGameState(from: GameState, to: GameState){
        clearUI(gameState: from)
        updateUI(gameState: to)
    }
    private func updateUI(gameState: GameState){
        //add message for the new state
    }
    private func clearUI(gameState: GameState){
        //clear previous state Message
    }
    private func remove(message: String){
        childNode(withName: message)?.removeFromParent()
    }
}
