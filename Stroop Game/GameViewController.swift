//
//  GameViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/12/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit


class GameViewController: UIViewController {
    
    
    
    //MARK:- Outlets
    @IBOutlet weak var boxTL: UIView!
    @IBOutlet weak var boxTR: UIView!
    @IBOutlet weak var boxBL: UIView!
    @IBOutlet weak var boxBR: UIView!
    @IBOutlet weak var colorWordLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    // MARK:- variables & constants
    private var colorsArray = [#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
    private var oldColorsArray = [#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
    private let gameBrain = GameModel()
    
    
    
    // MARK:- functions
    ///Updates Color Word Label
    private func updateColorLabel() {
        oldColorsArray[0] = colorsArray[0]
        gameBrain.oldWordsArray[0] = gameBrain.wordsArray[0]
        while colorsArray[0] == oldColorsArray[0] {
            colorsArray.shuffle()
        }
        while gameBrain.wordsArray[0] == gameBrain.oldWordsArray[0] {
            gameBrain.wordsArray.shuffle()
        }
        colorWordLabel.textColor = colorsArray[0]
        colorWordLabel.text = gameBrain.wordsArray[0]
    }
    
    
    
    ///View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGameLabels()
        gameBrain.highScore = UserDefaults.standard.integer(forKey: "highScore")
    }
    
    
    
    ///Game buttons/selections pressed.
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        colorButtonPressed(buttonPressed: sender)
    }
    

    
    ///Game timer logic.
    private func startTimer() {
            self.timerLabel.text = "Timer: \(self.gameBrain.timeRemaining)"
//            if  self.gameBrain.timeRemaining <= 0 {
//                self.gameOver()
//            }
        
//  }
    }
    

    
    ///Keeps track of correct and incorrect answer selections and calls functions according to answer selection.
    private func colorButtonPressed(buttonPressed: UIButton) {
        if buttonPressed.backgroundColor == colorsArray[0] {
            gameBrain.answerIsCorrect = true
            updateColorLabel()
        } else {
            gameBrain.answerIsCorrect = false
            
        }
        checkTheClock()
        gameBrain.playGame()
        if gameBrain.gameIsOver == true {
            gameOver()
        }
    }
    
    
    
    ///Passes end of game data to score screen via segue.
    private func gameOver() {
        performSegue(withIdentifier: "endGameSegue", sender: nil)
        resetGameLabels()
    }
    
    
    
    ///Resets game logic to default settings.
    private func resetGameLabels() {
        colorWordLabel.text = "START"
        colorWordLabel.textColor = colorsArray[0]
        timerLabel.text = "Timer: \(gameBrain.timeRemaining)"
    }
    
    
    
    ///Starts the timer once first correct answer is selected.
    private func checkTheClock() {
        if gameBrain.clockShouldBeRunning && !gameBrain.timerIsRunning {
            startTimer()
        }
    }
    
    
    
    ///Segue data.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ScoreScreenViewController {
            nextVC.updateHighScore = gameBrain.highScore
            nextVC.updateGameScore = gameBrain.currentScore
            nextVC.congratsHighScore = gameBrain.highScoreIsNew
        }
    }
    
    
}

