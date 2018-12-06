//
//  StartScreenViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 11/16/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    
    @IBOutlet weak var gameLogo: UILabel!
    @IBOutlet weak var gameHighScore: UILabel!
    @IBOutlet weak var startButton: UIButton!

    
    let highscore = UserDefaults.standard.integer(forKey: "highScore")
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameLogo.font = gameLogo.font.withSize(gameLogo.frame.height * 7/8)
        
        gameHighScore.text = "High Score: \(highscore)"
        UIView.animate(withDuration: TimeInterval(1.0), delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.startButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    

}
