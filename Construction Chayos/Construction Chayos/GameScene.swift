//
//  GameScene.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-05-31.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    let button = SKSpriteNode(imageNamed: "playbutton")
    
    override func didMove(to view: SKView) {
        //background images
        backgroundColor = SKColor.gray
        let background = SKSpriteNode(imageNamed: "backgroundRocks")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        background.scale(to: CGSize(width: 1536, height: 2048))
        addChild(background)
        
<<<<<<< HEAD
        // Calculate playable margin
        let maxAspectRatio: CGFloat = 16.0/9.0
        let maxAspectRatioHeight = size.width / maxAspectRatio
        let playableMargin: CGFloat = (size.height - maxAspectRatioHeight)/2
        
//        let playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: size.height-playableMargin*2)
//        physicsBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        
        //Physic items
        physicsWorld.contactDelegate = self
        physicsBody!.categoryBitMask = PhysicsCategory.Edge
        
        enumerateChildNodes(withName: "//*", using: { node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
                }
            })
        
        playerNode = childNode(withName: "Player") as? PlayerNode
=======
        //title on page
        let titleLabel = SKLabelNode(fontNamed: "Chalkduster")
        titleLabel.text = "Construction Chayos"
        titleLabel.fontColor = SKColor.yellow
        titleLabel.fontSize = 70
        //lable.zPosition = 150
        titleLabel.position = CGPoint(x: size.width/2, y:size.height-size.height/4)
        addChild(titleLabel)
>>>>>>> 780f035c8990aa17074400146e8da0e94f6b12c6
        

        button.name = "btn"
        button.size.height = 200
        button.size.width = 200
        button.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(button)
        
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name {
            if name == "btn" {
                let scene = levelOne(size:CGSize(width:1536, height:2048 ))
                let skView = self.view as! SKView
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .aspectFill
                skView.presentScene(scene)
                
               //let scene = SKScene(fileNamed: "LevelOne")
              //  scene?.size = CGSize(width: 1536, height: 2048)
              //  scene?.scaleMode = .aspectFill
              //  view?.presentScene(scene!)
                
            }
        }

}
}

