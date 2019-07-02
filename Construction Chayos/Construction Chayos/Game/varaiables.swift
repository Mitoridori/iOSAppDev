//
//  varaiables.swift
//  Construction Chayos
//
//  Created by Rebecca Stewart on 2019-06-25.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import SpriteKit

class Varaiables: SKScene, InteractiveNode{
    
    public var curtLevel = 1
    
    func interact() {
        //Loads Information stored as a key (which is called hello) and stores in in the variable hello
        if(UserDefaults.standard.object(forKey: "curtLevel") != nil)
        {
            curtLevel = UserDefaults.standard.object(forKey: "curtLevel") as! Int
        }
        
        print ("Varaiables", curtLevel)  
    }
    
    func getCurrentLvl()-> Int{
        if(UserDefaults.standard.object(forKey: "curtLevel") != nil)
        {
            curtLevel = UserDefaults.standard.object(forKey: "curtLevel") as! Int
        }
        
        print ("Varaiables", curtLevel)
        return curtLevel
    }
    
    func SetLevel(i: Int )
    {
        curtLevel = i
        //Saves Information passed in (hello, ) in key (forKey: "hello"
        UserDefaults.standard.set(curtLevel, forKey: "curtLevel")
    }

    func getlevel() {
        getCurrentLvl()
        curtLevel += 1
        print("Get Level: ", curtLevel)
        SetLevel(i: curtLevel)
        
    }
    
}

