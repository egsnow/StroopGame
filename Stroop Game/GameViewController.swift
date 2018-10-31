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
    var blinkTimer: Timer?
    var colorsArray = [#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
    var gameTimer: Timer?
    let gameBrain = GameModel()
    
    
    
    // MARK:- functions
    //UPDATE LABELS
    func updateLabel() {
        colorsArray.shuffle()
        colorWordLabel.textColor = colorsArray[0]
        colorWordLabel.text = gameBrain.wordsArray[0]
    }
    
    
    
    //VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        newGameViews()
        checkTheClock()
        gameBrain.updateHighScore()
    }
    
    
    
    //TOP LEFT BUTTON
    @IBAction func button0(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
    }
    
    
    
    //TOP RIGHT BUTTON
    @IBAction func button1(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
    }
    
    
    
    //BOTTOM LEFT BUTTON
    @IBAction func button2(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
    }
    
    
    
    //BOTTOM RIGHT BUTTON
    @IBAction func button3(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
    }

    
    
    //GAME TIMER
    func startTimer() {
        gameBrain.timerIsRunning = true
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.gameBrain.myTimer -= 1
            self.timerLabel.text = "Timer: \(self.gameBrain.myTimer)"
            if  self.gameBrain.myTimer <= 0 {
                self.gameOver()
            }
            
        }
    }
    

    
    //BLINK COLOR TIMER
    func colorTimer(){
        var myColorInt = 0
        blinkTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            myColorInt += 1
            myColorInt %= 4
            }
    }

    
    
    //IS THE ANSWER CORRECT?
    func answerButton(buttonPressed: UIButton) {
        if buttonPressed.backgroundColor == colorsArray[0] {
            gameBrain.myAnswer = true
            updateLabel()
        } else {
            gameBrain.myAnswer = false
        }
        checkTheClock()
        if gameBrain.gameIsOver == true {
            gameOver()
        }
    }
    
    
    
    //GAME OVER
    func gameOver() {
        gameTimer?.invalidate()
        performSegue(withIdentifier: "endGameSegue", sender: nil)
        newGameViews()
        timerLabel.text = "Timer: \(gameBrain.myTimer)"
    }
    
    
    
    //NEW GAME
    func newGameViews() {
        gameBrain.startNewGame()
        colorWordLabel.text = "START"
        blinkTimer?.invalidate()
        colorWordLabel.textColor = colorsArray[0]
        timerLabel.text = "Timer: \(gameBrain.myTimer)"
    }
    
    
    
    //HAS THE GAME STARTED?
    func checkTheClock() {
        gameBrain.playGame()
        if gameBrain.clockShouldBeRunning && !gameBrain.timerIsRunning {
            startTimer()
        }
    }
    
    
    
    
}

