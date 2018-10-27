//
//  ViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/12/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var replayGame: UIButton!
    @IBOutlet weak var boxTL: UIView!
    @IBOutlet weak var boxTR: UIView!
    @IBOutlet weak var boxBL: UIView!
    @IBOutlet weak var boxBR: UIView!
    @IBOutlet weak var colorWordLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    
    var blinkTimer: Timer?
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
            updateScore()
        } else {
        }
    }
    
    func updateScore() {
        if myAnswer == true {
            myScore += 1
        } else {
            if myScore <= 0 {
                myScore = 0
            } else {
                myScore -= 1
            }
        }
    }
    
    func countdownTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.myTimer -= 1
            self.timerLabel.text = "Timer: \(self.myTimer)"
            if  self.myTimer <= 0 {
                timer.invalidate()
                self.boxTL.isHidden = true
                self.boxTR.isHidden = true
                self.boxBL.isHidden = true
                self.boxBR.isHidden = true
                self.colorWordLabel.text = ""
                self.gameOverLabel.text = "GAME OVER"
                self.replayGame.isEnabled = true
                self.replayGame.setTitle("Play Again?", for: .normal)
                self.colorTimer()
                self.timerLabel.text = "Score: \(self.myScore)"
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
    }
    
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        startNewGame()
    }
    
    
    func startNewGame() {
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
        replayGame.setTitle("", for: .normal)

    }
    
}
