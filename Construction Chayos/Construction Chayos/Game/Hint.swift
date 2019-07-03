//
//  Hint.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-07-02.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class Hint: SKScene{
    
    var vara = Varaiables()
    var lvlHints: SKLabelNode!
    let button = SKSpriteNode(imageNamed: "Windows_17")
    
    
    func lvlCheck(){
        
        vara.getCurrentLvl()
        if vara.getCurrentLvl() == 1
        {
            hintLvlOne()
        }
        else if vara.getCurrentLvl() == 2
        {
            hintLvlTwo()
        }
        else if vara.getCurrentLvl() == 3
        {
            hintLvlThree()
        }
        
    }
    func buildHint(){
        lvlHints = SKLabelNode(fontNamed: "Chalkduster")
        lvlHints.fontSize = 50
        lvlHints.numberOfLines = 0
        lvlHints.fontColor = SKColor.black
        lvlHints.position = CGPoint(x: size.width/2, y: size.height/2)
        lvlHints.bringToFront()
        button.name = "btn"
        button.size.height = 2048
        button.size.width = 1536
        button.alpha = 0.95
        button.position = CGPoint(x: size.width/2, y: size.height/2)
        
        
        
    }
    
    func hintLvlOne(){
        
        buildHint()
        lvlHints.text = "Bricks are here \n CR3, OU3, AL1, PD1 \n BD1, RR2, QD2, XR5 \n Key: \n Right, Left, Up, Down"
    }
    
    func hintLvlTwo(){
        
        buildHint()
        lvlHints.text = "Level Two hints!"
    }
    
    func hintLvlThree(){
        
        buildHint()
        lvlHints.text = "Level Three hints!"
        
    }
    
    
    
}
