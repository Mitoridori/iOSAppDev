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
    var levelTwo: SKSpriteNode!
    var levelThree: SKSpriteNode!
    var TCOne: SKSpriteNode!
    var TCTwo: SKSpriteNode!
    var TCThree: SKSpriteNode!
    var movesMade: SKLabelNode!
    var tapToStart: SKLabelNode!
    
    var bricksNode: BricksNode!
    var vbrickNode: VBrickNode!

    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    var TotalMoves = 0 {
        didSet {
            movesMade.text = "\(TotalMoves)"
            
        }
    }
    var savedMoves = 0
    var vara = Varaiables()
 
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
        gameState = .start
        
        playerNode = childNode(withName: "Player") as? PlayerNode
        Brick = self.childNode(withName: "Brick") as? SKSpriteNode
        brickManager = BrickManager()
        brickManager?.FindAllBricks(gameScene: self)
        
        gameState = .start
        movesMadeLabel()
        beginGameLabel()
        addObservers()
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
            }
            
        default:
            break
            
        }
    }
    
    class func level(levelNum: Int) -> GameScene? {
        let scene = GameScene(fileNamed: "Level\(levelNum)")!
        scene.vara.curtLevel = levelNum
        scene.scaleMode = .aspectFit
        return scene
    }

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
        if gameState != .quit {
            saveGame()
            
        }
        
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

extension GameScene {
    
    func saveGame() {
        
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first
            else {return}
        let saveURL = directory.appendingPathComponent("SavedGames")
        
        do {
            try fileManager.createDirectory(atPath: saveURL.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            
            fatalError("Failed to create directoy: \(error.debugDescription)")
        }
        
        let fileURL = saveURL.appendingPathComponent("saved-game")
        print("* Saving: \(fileURL.path)")
        
        NSKeyedArchiver.archiveRootObject(self, toFile: fileURL.path)
        
    }
    
    override func encode(with aCoder: NSCoder) {

        aCoder.encode(vara.curtLevel, forKey: "GamesCurrentLevel")
        aCoder.encode(gameState.rawValue, forKey: "gamesState")
        super.encode(with: aCoder)
        
    }
    
    class func loadGame() -> SKScene? {
        
        print("* Loading")
        var scene: SKScene?
        
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first
            else{return nil}
        
        let url = directory.appendingPathComponent("SavedGames/saved-game")
        
        if FileManager.default.fileExists(atPath: url.path) {
            scene = NSKeyedUnarchiver.unarchiveObject(withFile: url.path) as? GameScene
            _ = try? fileManager.removeItem(at: url)
            
        }
        return scene
    }
    
}

