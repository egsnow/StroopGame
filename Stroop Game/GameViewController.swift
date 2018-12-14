//
//  GameViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/12/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, GameDelegate {

    
    //MARK:- Outlets
    @IBOutlet weak var boxTL: UIView!
    @IBOutlet weak var boxTR: UIView!
    @IBOutlet weak var boxBL: UIView!
    @IBOutlet weak var boxBR: UIView!
    @IBOutlet weak var colorWordLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet var colorButtons: [UIButton]!
    
    // MARK:- variables & constants
    private var colorsArray = [#colorLiteral(red: 0.5981579423, green: 0.1302183867, blue: 0.07905782014, alpha: 1), #colorLiteral(red: 0.1021426842, green: 0.1914339662, blue: 0.07176273316, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.7728164792, green: 0.6411972642, blue: 0.2131647766, alpha: 1)]
    private var oldColorsArray = [#colorLiteral(red: 0.5981579423, green: 0.1302183867, blue: 0.07905782014, alpha: 1), #colorLiteral(red: 0.1021426842, green: 0.1914339662, blue: 0.07176273316, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.7728164792, green: 0.6411972642, blue: 0.2131647766, alpha: 1)]
    private let words = ["RED", "GREEN", "WHITE", "GOLD"]
    var gameTime = 10
    
    private var gameBrain: GameModel?
    
    
    
    
    ///View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "Timer: \(gameTime)"
        for (index, color) in colorsArray.enumerated() {
            colorButtons[index].backgroundColor = color
        }
        
        for button in colorButtons {
            button.layer.cornerRadius = 50
            button.layer.borderWidth = 4
            button.layer.borderColor = UIColor.black.cgColor
        }
        
        gameBrain = GameModel(words: words, gameTimePassed: gameTime)
        
        if gameBrain == nil {
            fatalError("GAMEMODEL object could not initialize.")
        }
        
        playSound("clack")
        gameBrain!.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        gameBrain!.startNewGame()
    }
    
    
    
    
    
    // MARK:- functions
    ///Updates Color Word Label
    private func updateColorLabel() {
        oldColorsArray[0] = colorsArray[0]
        gameBrain!.oldXmasWordsArray[0] = gameBrain!.xmasWordsArray[0]
        while colorsArray[0] == oldColorsArray[0] {
            colorsArray.shuffle()
        }
        while gameBrain!.xmasWordsArray[0] == gameBrain!.oldXmasWordsArray[0] {
            gameBrain!.xmasWordsArray.shuffle()
        }
        colorWordLabel.textColor = colorsArray[0]
        colorWordLabel.text = gameBrain!.xmasWordsArray[0]
    }
    
    
    

    

    
    ///Game buttons/selections pressed.
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        colorButtonPressed(buttonPressed: sender)
    }
    
    
    ///Game timer logic.
    internal func updateTimerLabel(timeRemaining: Int) {
            self.timerLabel.text = "Timer: \(self.gameBrain!.timeRemaining)"
    }
    

    ///Keeps track of correct and incorrect answer selections and calls functions according to answer selection.
    private func colorButtonPressed(buttonPressed: UIButton) {
        if buttonPressed.backgroundColor == colorsArray[0] {
            gameBrain!.answerIsCorrect = true
            updateColorLabel()
        } else {
            gameBrain!.answerIsCorrect = false
        }
        gameBrain!.playGame()
    }
    
    
    ///Passes end of game data to score screen via segue.
    internal func gameOver() {
        performSegue(withIdentifier: "endGameSegue", sender: nil)
    }
    
    
    ///Resets game logic to default settings.
    internal func resetGameLabels(timeRemaining: Int) {
        colorWordLabel.text = "START"
        colorWordLabel.textColor = colorsArray[0]
        timerLabel.text = "Timer: \(gameBrain!.timeRemaining)"
    }
    
    
    ///Segue data.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ScoreScreenViewController {
            nextVC.updateHighScore = gameBrain!.highScore
            nextVC.updateGameScore = gameBrain!.currentScore
            nextVC.congratsHighScore = gameBrain!.highScoreIsNew
        }
    }
    
    
    
    @IBAction func backButton(_ sender: UIButton) {
        gameBrain!.stopTheTimer()
        dismiss(animated: true, completion: nil)
    }
    
}

