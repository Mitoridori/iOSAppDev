//
//  titleScreen.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-11.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class titleScene: SKScene {
    
    let button = SKSpriteNode(imageNamed: "playbutton")
    
    override func didMove(to view: SKView) {
        //background images
        backgroundColor = SKColor.gray
        let background = SKSpriteNode(imageNamed: "backgroundRocks")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        background.scale(to: CGSize(width: 1536, height: 2048))
        addChild(background)
        
        //title on page
        let titleLabel = SKLabelNode(fontNamed: "Chalkduster")
        titleLabel.text = "Construction Chayos"
        titleLabel.fontColor = SKColor.yellow
        titleLabel.fontSize = 70
        //lable.zPosition = 150
        titleLabel.position = CGPoint(x: size.width/2, y:size.height-size.height/4)
        addChild(titleLabel)
        
        
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
                //                let scene = levelOne(size:CGSize(width:1536, height:2048 ))
                //                let skView = self.view as! SKView
                //                skView.showsFPS = true
                //                skView.showsNodeCount = true
                //                skView.ignoresSiblingOrder = true
                //                scene.scaleMode = .aspectFill
                //                skView.presentScene(scene)
                
                let scene = SKScene(fileNamed: "LevelOne")
                scene?.size = CGSize(width: 1536, height: 2048)
                scene?.scaleMode = .aspectFill
                view?.presentScene(scene!)
                
            }
        }
        
    }
}

