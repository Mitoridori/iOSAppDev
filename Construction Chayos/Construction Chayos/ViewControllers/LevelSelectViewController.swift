
//  LevelSelectViewController.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-12.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import UIKit

class LevelSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func levelOne(_ sender: UIButton) {
    
        if let gameViewController = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController {
            
            navigationController?.pushViewController(gameViewController, animated: false)
            
        }
        
    }

}
