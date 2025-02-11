//
//  GameScene.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-05-31.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

protocol EventListenerNode {
    func didMoveToScene()
    }

protocol InteractiveNode {
    func interact()
}

class GameScene: SKScene, SKPhysicsContactDelegate {

    var playerNode:PlayerNode!
    var Brick: SKSpriteNode!
    var movesMade: SKLabelNode!
    var tapToStart: SKLabelNode!
    var toggleAudioSwitchOff: SKSpriteNode!
    var toggleAudioSwitchOn: SKSpriteNode!
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    var TotalMoves = 0 {
        didSet {
            movesMade.text = "\(TotalMoves)"
        }
    }
    var savedMoves = 0
    var vara = Varaiables()
    var hint = Hint()
    var brickManager:BrickManager? = nil
    var truckHorn = SKAction.playSoundFileNamed("horn.mp3", waitForCompletion: true)
    let tinHits = SKAction.playSoundFileNamed("tinSound.mp3", waitForCompletion: true)
    var hud = HUD()
    var gameState: GameState = .initial {
        didSet{
            hud.updateGameState(from: oldValue, to: gameState)
        }
    }

    override func didMove(to view: SKView){
         physicsWorld.contactDelegate = self
        
        let playableArea = CGRect(x: -480, y: -480, width: 960, height: 960)
        physicsBody = SKPhysicsBody(edgeLoopFrom: playableArea)

        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
                }
            })
        SKTAudio.sharedInstance().playBackgroundMusic("backgroundSound.mp3")
        gameState = .start

        Brick = self.childNode(withName: "Brick") as? SKSpriteNode
        toggleAudioSwitchOff = childNode(withName: "Mute") as? SKSpriteNode
        toggleAudioSwitchOn = childNode(withName: "Unmute") as? SKSpriteNode
        
        brickManager = BrickManager()
        brickManager?.FindAllBricks(gameScene: self)
        
        gameState = .start
        movesMadeLabel()
        beginGameLabel()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == PhysicsCategory.Player | PhysicsCategory.TrafficCone {
            run(SKAction.sequence([truckHorn, truckHorn, SKAction.run(didWin) ]))
        }
        if collision == PhysicsCategory.Brick | PhysicsCategory.Board {
            run(SKAction.sequence([tinHits]))
        }
        if collision == PhysicsCategory.Brick | PhysicsCategory.Brick {
            run(SKAction.sequence([tinHits]))
        }
    }
    
    func movesMadeLabel() {

        movesMade = SKLabelNode(fontNamed: "Chalkduster")
        movesMade.text = "\(TotalMoves)"
        movesMade.fontSize = 72
        movesMade.position = CGPoint(x: -118.561, y: 845)
        movesMade.bringToFront()
        addChild(movesMade)

    }
    
    func beginGameLabel() {
        
        tapToStart = SKLabelNode(fontNamed: "Chalkduster")
        tapToStart.text = "Tap screen to begin"
        tapToStart.fontSize = 90
        tapToStart.position = .zero
        tapToStart.bringToFront()
        addChild(tapToStart)
        
    }

    func getTotalMoves() {
        TotalMoves = brickManager!.totalMoves
    }
    
    func saveTotalMoves() {
        
        if(UserDefaults.standard.object(forKey: "savedMoves") != nil)
        {
            savedMoves = UserDefaults.standard.object(forKey: "savedMoves") as! Int
        }
        
    }
    
    func setSavedMoves(i: Int) {
        
        savedMoves = i
        UserDefaults.standard.set(TotalMoves, forKey: "savedMoves")
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        getTotalMoves()
        
        if gameState != .play {
            isPaused = true
            return
        }
    }
    
    func newGame() {
        vara.getCurrentLvl()
        transitionToScene(level: vara.curtLevel)

    }
    
    func levelSelect() {

        let scene = SKScene(fileNamed: "LevelSelect")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)

    }
    
    func didWin() {
        let scene = SKScene(fileNamed: "WinScreen")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
    }
    
    func toggleAudioOff() {
        
        SKTAudio.sharedInstance().pauseBackgroundMusic()
        
    }
    
    func toggleAudioOn() {

        SKTAudio.sharedInstance().resumeBackgroundMusic()
        
    }
    
    func transitionToScene(level: Int){
        guard let newScene = SKScene(fileNamed: "Level\(level)")
            as? GameScene else{
                fatalError("Level:\(level) not found")
        }
        newScene.vara.curtLevel = level
        newScene.scaleMode = .aspectFit
        view?.presentScene(newScene, transition: SKTransition.flipVertical(withDuration: 0.4))

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        switch gameState {
        case .start:
            gameState = .play
            isPaused = false
            tapToStart.removeFromParent()
        
        case .play:
            if let name = touchedNode.name {
                if name == "Reset" {
                    newGame()
                }
                else if name == "LevelSelect" {
                    levelSelect()
                }
                else if name == "Hint" {
                    hint.lvlCheck()
                    addHint()
                    
                }
                else if name == "btn" {
                    removeHint()
                }
                else if name == "Mute" {
                    toggleAudioOff()
                    
                }
                else if name == "Unmute" {
                    toggleAudioOn()
                    
                }
                
            }
            
        default:
            break
            
        }
    }
    
    func addHint(){
        addChild(hint.button)
        addChild(hint.lvlHints)
        addChild(hint.lvlPicture)
        addChild(hint.key)
    }
    
    func removeHint(){
        hint.lvlHints.removeFromParent()
        hint.button.removeFromParent()
        hint.lvlPicture.removeFromParent()
        hint.key.removeFromParent()
    }
    
    
    class func level(levelNum: Int) -> GameScene? {
        let scene = GameScene(fileNamed: "Level\(levelNum)")!
        scene.vara.curtLevel = levelNum
        scene.scaleMode = .aspectFit
        return scene
    }

}

