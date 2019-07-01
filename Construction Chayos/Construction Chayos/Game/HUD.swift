//
//  HUD.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-07-01.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

enum HUDSettings {
    static let font = "Chalkduster"
    static let fontSize: CGFloat = 72
    
}
enum HUDMessages {
    static let tapToStart = "Tap to begin puzzle"
    static let win = "You Win!"
    static let playAgain = "Play level again?"
    static let reload = "Restart the level?"
    static let yes = "Yes"
    static let no = "No"
    
}

class HUD: SKNode {
    
    var movesMade: SKLabelNode!
    var brickManager:BrickManager? = nil
    
    var TotalMoves = 0 {
        didSet {
            movesMade.text = "\(TotalMoves)"
            
        }
    }
    
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    
    override init() {
        super.init()
        name = "HUD"
        
        brickManager = BrickManager()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func add(message: String, position: CGPoint,
             fontSize: CGFloat = HUDSettings.fontSize) {
        let label: SKLabelNode
        label = SKLabelNode(fontNamed: HUDSettings.font)
        label.text = message
        label.name = message
        label.zPosition = 100
        addChild(label)
        label.fontSize = fontSize
        label.position = position
    }
    
    
    func movesMadeLabel() {
        
        movesMade = SKLabelNode(fontNamed: "Chalkduster")
        movesMade.text = "\(TotalMoves)"
        movesMade.fontSize = 72
        movesMade.position = CGPoint(x: -118.561, y: 850)
        movesMade.bringToFront()
        addChild(movesMade)
        
    }
    
    func getTotalMoves() {
        
        TotalMoves = brickManager!.totalMoves
        
    }
    
    func updateHUD(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        getTotalMoves()
    }

    func updateGameState(from: GameState, to: GameState){
        clearUI(gameState: from)
        updateUI(gameState: to)
    }
    private func updateUI(gameState: GameState){
        switch gameState {
        case .start:
            add(message: HUDMessages.tapToStart, position: .zero)
            
        default:
            break
        }
    }
    private func clearUI(gameState: GameState){
        switch gameState {
        case .start:
            remove(message: HUDMessages.tapToStart)
            
        default:
            break
        }
    }
    private func remove(message: String){
        childNode(withName: message)?.removeFromParent()
    }
    
}
