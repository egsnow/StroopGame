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
    private var blinkColorsArray = [#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)]
    private var loserColorsArray = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]

    
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
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
///Cycles through array of colors to blink the label if new high score is achieved.
    private func colorTimer() {
        var myColorInt = 0
        blinkTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            myColorInt += 1
            myColorInt %= 5
            if self.congratsHighScore == true {
                self.congratsLabel.textColor = self.blinkColorsArray[myColorInt]
                self.congratsLabel.text = "new\nhigh\nscore" 
            } else {
                self.congratsLabel.textColor = self.loserColorsArray[myColorInt]
                self.congratsLabel.text = "you\nget\ncoal"

            }
        }
    }
    
    
    ///Starts new game.
    @IBAction func playAgainButton() {
        dismiss(animated: true, completion: nil)
    }
    
}
