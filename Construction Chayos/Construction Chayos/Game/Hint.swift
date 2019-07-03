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
    var lvlPicture: SKSpriteNode!
    var key: SKLabelNode!
    
    
    func lvlCheck(){
        
        vara.getCurrentLvl()
        if vara.curtLevel == 1
        {
            hintLvlOne()
        }
        else if vara.curtLevel == 2
        {
            hintLvlTwo()
        }
        else if vara.curtLevel == 3
        {
            hintLvlThree()
        }
        
    }
    func buildHint(){
        lvlHints = SKLabelNode(fontNamed: "Chalkduster")
        lvlHints.fontSize = 50
        lvlHints.numberOfLines = 0
        lvlHints.fontColor = SKColor.black
        lvlHints.position = CGPoint(x: size.width/2, y: 300)
        lvlHints.bringToFront()
        button.name = "btn"
        button.size.height = 2048
        button.size.width = 1536
        button.alpha = 0.95
        button.position = CGPoint(x: size.width/2, y: size.height/2)
        lvlPicture = SKSpriteNode(imageNamed: "gridBG\(vara.curtLevel)")
        lvlPicture.position = CGPoint(x: size.width/2, y: -100)
        lvlPicture.size.height = 400
        lvlPicture.size.width = 400
        key = SKLabelNode(fontNamed: "Chalkduster")
        key.fontSize = 50
        key.numberOfLines = 0
        key.fontColor = SKColor.black
        key.position = CGPoint(x: size.width/2, y: -500)
        key.text = "Key: \n R=Right, L=Left, U=Up, D=Down"
        
        
    }
    
    func hintLvlOne(){
        
        buildHint()
        lvlHints.text = "Solution \n CR3, OU3, AL1, PD1 \n BD1, RR2, QD2, XR5 \n "
    }
    
    func hintLvlTwo(){
        
        buildHint()
        lvlHints.text = "Solution \n OU3, XR1, BD2, QR1, ED3 \n RL1, QL1, BU3, XL1, OD3, \n QR3, PU1, AL3, PD1, QL3 \n OU3, XR1, BD4, XL1, OD3, \n QR3, EU2, RR3, PU3, XL5"
    }
    
    func hintLvlThree(){
        
        buildHint()
        lvlHints.text = "Solution \n PU2, QL2, XR1, BU4, XL1 \n AL1, PD3, QR3, OU1, AL3 \n OD1, QL3, PU3, XR1, BD4, \n XL1, PD3, RR3, QR3, OU3 \n XL5"
        
    }
    
    
    
}
