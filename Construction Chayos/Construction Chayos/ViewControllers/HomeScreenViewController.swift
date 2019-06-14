//
//  HomeScreenViewController.swift
//  Construction Chayos
//
//  Created by john gotts on 2019-06-13.
//  Copyright © 2019 Rebecca Stewart. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func playGame(_ sender: UIButton) {
        
        if let levelSelectViewController = storyboard?.instantiateViewController(withIdentifier: "LevelSelectViewController") as? LevelSelectViewController {
            
            navigationController?.pushViewController(levelSelectViewController, animated: false)
        }
        
    }
    
    @IBAction func quitGame(_ sender: UIButton) {
        
        exit(0)
        
    }

}
