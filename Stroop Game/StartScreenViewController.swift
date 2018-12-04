//
//  StartScreenViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 11/16/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    
    @IBOutlet weak var gameHighScore: UILabel!
    
    let highscore = UserDefaults.standard.integer(forKey: "highScore")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameHighScore.text = "High Score: \(highscore)"
        
        
    }
    

    
    
    
    
    
    
    
    
    
    

}
