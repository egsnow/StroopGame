//
//  GameViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/12/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var replayGame: UIButton!
    @IBOutlet weak var boxTL: UIView!
    @IBOutlet weak var boxTR: UIView!
    @IBOutlet weak var boxBL: UIView!
    @IBOutlet weak var boxBR: UIView!
    @IBOutlet weak var colorWordLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    var highScore = 0
    var blinkTimer: Timer?
    var gameTimer: Timer?
    var timerIsRunning = false
    var myTimer = 10
    var myScore = 0
    var myAnswer = true
    var colorsArray = [#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
    var wordsArray = ["BLUE", "RED", "YELLOW", "GREEN"]
    
    
    @IBAction func button0(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
        backgroundColor()
        updateLabel()
        runTheClock()
    }
    
    
    @IBAction func button1(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
        backgroundColor()
        updateLabel()
        runTheClock()
    }
    
    
    @IBAction func button2(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
        backgroundColor()
        updateLabel()
        runTheClock()
    }
    
    
    @IBAction func button3(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
        backgroundColor()
        updateLabel()
        runTheClock()
    }
    
    
    func backgroundColor() {
        colorsArray.shuffle()
        wordsArray.shuffle()
        boxTL.backgroundColor = colorsArray[0]
        boxTR.backgroundColor = colorsArray[1]
        boxBL.backgroundColor = colorsArray[2]
        boxBR.backgroundColor = colorsArray[3]
    }
    
    
    func updateLabel() {
        wordsArray.shuffle()
        colorsArray.shuffle()
        colorWordLabel.textColor = colorsArray[0]
        colorWordLabel.text = wordsArray[0]
        highScoreLabel.text = "HighScore: \(highScore)"
    }
    
    
    func answerButton(buttonPressed: UIButton) {
        if buttonPressed.backgroundColor == colorsArray[0] {
            myAnswer = true
        } else {
            myAnswer = false
        }
    }
    
    
    func runTheClock() {
        if myAnswer == true && timerIsRunning == false {
            timerIsRunning = true
            countdownTimer()
        } else if myAnswer == true && timerIsRunning == true {
            updateScore()
        } else if myAnswer == false && timerIsRunning == true {
            endGame()
        } else if myAnswer == false && timerIsRunning == false {
            colorWordLabel.text = "START"
        }
    }
    
    
    func updateHighScore() {
        if highScore < myScore {
            highScore = myScore
        }
        highScoreLabel.text = "High Score: \(highScore)"
    }
    
    
    func updateScore() {
        if myAnswer == true {
            myScore += 1
        }
    }
    
    
    func countdownTimer() {
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.myTimer -= 1
            self.timerLabel.text = "Timer: \(self.myTimer)"
            if  self.myTimer <= 0 {
                self.endGame()
            }
        }
    }
    
    
    func colorTimer(){
        var myColorInt = 0
        blinkTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            myColorInt += 1
            myColorInt %= 4
            self.gameOverLabel.textColor = self.colorsArray[myColorInt]
            self.replayGame.setTitleColor(self.colorsArray[myColorInt], for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorWordLabel.text = "START"
        backgroundColor()
        colorWordLabel.textColor = colorsArray[0]
        timerLabel.text = "Timer: \(myTimer)"
        replayGame.setTitle("", for: .normal)
        updateHighScore()
    }
    
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        startNewGame()
    }
    
    
    func endGame() {
        performSegue(withIdentifier: "endGameSegue", sender: nil)
        gameTimer?.invalidate()
        boxTL.isHidden = true
        boxTR.isHidden = true
        boxBL.isHidden = true
        boxBR.isHidden = true
        colorWordLabel.text = ""
        gameOverLabel.text = "GAME OVER"
        replayGame.isHidden = false
        replayGame.isEnabled = true
        replayGame.setTitle("Play Again?", for: .normal)
        colorTimer()
        timerLabel.text = "Score: \(myScore)"
        updateHighScore()
        updateScore()
    }
    
    
    func startNewGame() {
        replayGame.isHidden = true
        replayGame.isEnabled = false
        colorWordLabel.text = "START"
        gameOverLabel.text = ""
        blinkTimer?.invalidate()
        myScore = 0
        myTimer = 10
        myAnswer = true
        timerIsRunning = false
        self.boxTL.isHidden = false
        self.boxTR.isHidden = false
        self.boxBL.isHidden = false
        self.boxBR.isHidden = false
        backgroundColor()
        colorWordLabel.textColor = colorsArray[0]
        timerLabel.text = "Timer: \(myTimer)"
    }
    
}

