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
        background.scale(to: CGSize(width: 2048, height: 1536))
        addChild(background)
        
        //title on page
        let titleLabel = SKLabelNode(fontNamed: "Chalkduster")
        titleLabel.text = "Construction Chayos"
        titleLabel.fontColor = SKColor.yellow
        titleLabel.fontSize = 60
        //lable.zPosition = 150
        titleLabel.position = CGPoint(x: size.width/2, y:size.height-size.height/4)
        addChild(titleLabel)
        

        button.name = "btn"
        button.size.height = 100
        button.size.width = 100
        button.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(button)
        
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name {
            if name == "btn" {
                
               let scene = SKScene(fileNamed: "PlayScene")
                view?.presentScene(scene!)
                
            }
        }

}
}

