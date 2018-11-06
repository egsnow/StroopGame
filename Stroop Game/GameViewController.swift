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
    var colorsArray = [#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
    var gameTimer: Timer?
    let gameBrain = GameModel()

    
    
    // MARK:- functions
    ///Updates Color Word Label
    func updateColorLabel() {
        colorsArray.shuffle()
        gameBrain.wordsArray.shuffle()
        colorWordLabel.textColor = colorsArray[0]
        colorWordLabel.text = gameBrain.wordsArray[0]
    }
    
    
    
    ///View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        checkTheClock()
        gameBrain.updateHighScore()
    }
    
    
    
    ///Top left button
    @IBAction func button0(_ sender: UIButton) {
        colorButtonPressed(buttonPressed: sender)
    }
    
    
    
    ///Top right button
    @IBAction func button1(_ sender: UIButton) {
        colorButtonPressed(buttonPressed: sender)
    }
    
    
    
    ///Bottom left button
    @IBAction func button2(_ sender: UIButton) {
        colorButtonPressed(buttonPressed: sender)
    }
    
    
    
    ///Bottom right button
    @IBAction func button3(_ sender: UIButton) {
        colorButtonPressed(buttonPressed: sender)
    }

    
    
    ///Game timer logic.
    func startTimer() {
        gameBrain.timerIsRunning = true
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.gameBrain.timeRemaining -= 1
            self.timerLabel.text = "Timer: \(self.gameBrain.timeRemaining)"
            if  self.gameBrain.timeRemaining <= 0 {
                self.gameOver()
            }
            
        }
    }
    

    
    ///Keeps track of correct and incorrect answer selections and calls functions according to answer selection.
    func colorButtonPressed(buttonPressed: UIButton) {
        if buttonPressed.backgroundColor == colorsArray[0] {
            gameBrain.answerIsCorrect = true
            updateColorLabel()
        } else {
            gameBrain.answerIsCorrect = false
        }
        checkTheClock()
        if gameBrain.gameIsOver == true {
            gameOver()
        }
        gameBrain.playGame()
    }
    
    
    
    ///Passes end of game data to score screen via segue.
    func gameOver() {
        gameTimer?.invalidate()
        gameBrain.updateHighScore()
        performSegue(withIdentifier: "endGameSegue", sender: nil)
        resetGame()
        timerLabel.text = "Timer: \(gameBrain.timeRemaining)"
    }
    
    
    
    ///Resets game logic to default settings.
    func resetGame() {
        gameBrain.startNewGame()
        colorWordLabel.text = "START"
        colorWordLabel.textColor = colorsArray[0]
        timerLabel.text = "Timer: \(gameBrain.timeRemaining)"
    }
    
    
    
    ///Starts the timer once first correct answer is selected.
    func checkTheClock() {
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

