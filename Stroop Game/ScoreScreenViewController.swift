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
    private var blinkColorsArray = [#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1), #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1),]

    
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
        blinkTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            myColorInt += 1
            myColorInt %= 6
            if self.congratsHighScore == true {
                self.congratsLabel.textColor = self.blinkColorsArray[myColorInt]
                self.congratsLabel.text = "New High Score!" +
                "\n🎉 🥳  🎉 🥳 🎉 🥳 🎉"
            }
        }
    }
    
    
    ///Starts new game.
    @IBAction func playAgainButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
