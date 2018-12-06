//
//  ScoreScreenViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/26/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class ScoreScreenViewController: UIViewController {

    
    
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var congratsLabel: UILabel!
    
    
    
    var updateHighScore = 0
    var updateGameScore = 0
    var congratsHighScore = false
    private var blinkTimer: Timer?
    private var blinkColorsArray = [#colorLiteral(red: 0.5981579423, green: 0.1302183867, blue: 0.07905782014, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.7728164792, green: 0.6411972642, blue: 0.2131647766, alpha: 1), #colorLiteral(red: 0.1021426842, green: 0.1914339662, blue: 0.07176273316, alpha: 1)]

    
    ///Updates score labels to score screen.
    private func postScores () {
        highScoreLabel.text = "High Score: \(updateHighScore)"
        myScoreLabel.text = "Score: \(updateGameScore)"
        colorTimer()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postScores()
    }
    
    
    
///Cycles through array of colors to blink the label if new high score is achieved.
    private func colorTimer() {
        var myColorInt = 0
        blinkTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            myColorInt += 1
            myColorInt %= 4
            if self.congratsHighScore == true {
                self.congratsLabel.textColor = self.blinkColorsArray[myColorInt]
                self.congratsLabel.text = "New High Score!" +
                "\n☃️🎁🎄🎅🎄🎁☃️"
            }
        }
    }
    
    
    ///Starts new game.
    @IBAction func playAgainButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
