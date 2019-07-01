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

//struct PhysicsCategory {
//    static let None:     UInt32 = 0 << 0
//    static let Player:   UInt32 = 1 << 1
//    static let Brick:    UInt32 = 1 << 2
//    static let TrafficCone: UInt32 = 1 << 3
//    static let Board:    UInt32 = 1 << 4
//    
//}



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var playerNode:PlayerNode!
    var Brick: SKSpriteNode!
    var levelTwo: SKSpriteNode!
    var levelThree: SKSpriteNode!
    var TCOne: SKSpriteNode!
    var TCTwo: SKSpriteNode!
    var TCThree: SKSpriteNode!
    var movesMade: SKLabelNode!
    
    var bricksNode: BricksNode!
    var vbrickNode: VBrickNode!

    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    var TotalMoves = 0 {
        didSet {
            movesMade.text = "\(TotalMoves)"
            
        }
    }
    var vara = Varaiables()
    var currentLevel: Int = 1
    var brickManager:BrickManager? = nil
    
    var velocity = CGPoint.zero
    var lastTouchLocation: CGPoint?
    var brickSpeed: CGFloat = 100
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
        
        
        playerNode = childNode(withName: "Player") as? PlayerNode
        Brick = self.childNode(withName: "Brick") as? SKSpriteNode
        brickManager = BrickManager()
        brickManager?.FindAllBricks(gameScene: self)
        
        movesMadeLabel()
        update(0.5)
        gameState = .start
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == PhysicsCategory.Player | PhysicsCategory.TrafficCone {
            didWin()
            print("SUCCESS")}
        if collision == PhysicsCategory.Brick | PhysicsCategory.Board {
            
            print ("Brick and board edge collision")}
        if collision == PhysicsCategory.Brick | PhysicsCategory.Brick {
            print ("Bricks have collision") }
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
         transitionToScene(level: currentLevel)
        //view!.presentScene(GameScene.level(levelNum: currentLevel))
    }
    
    func levelSelect() {

        let scene = SKScene(fileNamed: "LevelSelect")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)

    }
    
    func didWin() {
        
        print ("level going into winscreen", currentLevel)
        let scene = SKScene(fileNamed: "WinScreen")
        scene?.size = CGSize(width: size.width, height: size.height)
        scene?.scaleMode = .aspectFit
        view!.presentScene(scene)
        


    }
    
    func transitionToScene(level: Int){
        guard let newScene = SKScene(fileNamed: "Level\(level)")
            as? GameScene else{
                fatalError("Level:\(level) not found")
        }
        newScene.currentLevel = level
        newScene.scaleMode = .aspectFit
        view?.presentScene(newScene, transition: SKTransition.flipVertical(withDuration: 0.5))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        switch gameState {
        case .start:
            gameState = .play
            isPaused = false
        
        case .play:
            if let name = touchedNode.name {
                if name == "Reset" {
                    newGame()
                }
                else if name == "LevelSelect" {
                    levelSelect()
                }
            }
            
        default:
            break
            
        }
    }
    
 
    class func level(levelNum: Int) -> GameScene? {
        let scene = GameScene(fileNamed: "Level\(levelNum)")!
        scene.currentLevel = levelNum
        scene.scaleMode = .aspectFit
        return scene
    }


//    func addSmoke() {
//        let smoke = SKEmitterNode(fileNamed: "smoke.sks")!
//        smoke.zPosition = -1
//        smoke.numParticlesToEmit = 1
//        smoke.run(SKAction.wait(forDuration: 3.0))
//    }
}

extension GameScene {
    func applicationDidBecomeActive() {
        print("* applicationDidBecomeActive")
        
    }
    
    func applicationWillResignActive() {
        print("* ResignActive")
        
    }
    
    func applicationDidEnterBackground() {
        print("* entered background")
        
    }
    
    func addObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { [weak self] _ in
            self?.applicationDidBecomeActive()
        }
        notificationCenter.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: nil) { [weak self] _ in
            self?.applicationWillResignActive()
            
        }
        notificationCenter.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { [weak self] _ in
            self?.applicationDidEnterBackground()
            
            
        }
        
    }
    
}

