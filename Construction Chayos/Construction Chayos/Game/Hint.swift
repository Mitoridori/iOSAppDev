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
    let button = SKSpriteNode(imageNamed: "LevelSelect")
    
    
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
        lvlHints.position = .zero
        lvlHints.bringToFront()
        button.name = "btn"
        button.size.height = 2000
        button.size.width = 1500
        button.alpha = 0.90
        button.position = CGPoint(x: size.width/2, y: size.height/3)
        
        
        
    }
    
    func hintLvlOne(){
        
        buildHint()
        lvlHints.text = "CR3, OU3, AL1, PD1, BD1, RR2, QD2, XR5"
    }
    
    func hintLvlTwo(){
        
        lvlHints = SKLabelNode(fontNamed: "Chalkduster")
        lvlHints.text = "Level Two hints!"
        lvlHints.fontSize = 50
        lvlHints.position = .zero
        lvlHints.bringToFront()
        button.name = "btn"
        button.size.height = 177
        button.size.width = 178
        button.position = CGPoint(x: size.width/2, y: size.height/3)
        
    }
    
    func hintLvlThree(){
        
        lvlHints = SKLabelNode(fontNamed: "Chalkduster")
        lvlHints.text = "Level Three hints!"
        lvlHints.fontSize = 50
        lvlHints.position = .zero
        lvlHints.bringToFront()
        button.name = "btn"
        button.size.height = 177
        button.size.width = 178
        button.position = CGPoint(x: size.width/2, y: size.height/3)
        
    }
    
    
    
}
