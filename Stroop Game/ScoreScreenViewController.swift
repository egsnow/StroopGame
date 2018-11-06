//
//  ScoreScreenViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/26/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class ScoreScreenViewController: UIViewController {

    var updateHighScore = 0
    var updateGameScore = 0
    
    
    func scores () {
        highScoreLabel.text = "High Score: \(updateHighScore)"
        myScoreLabel.text = "Score: \(updateGameScore)"
        

    }
    
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scores()
    }
    

    
    
    @IBAction func playAgainButton() {
        dismiss(animated: true, completion: nil)
    }

}
