//
//  GameModel.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/29/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func gameOver()
    func checkTheClock(clockShouldBeRunning: Bool, timerIsRunning: Bool)
    func startTimer(timerIsRunning: Bool, timeRemaining: Int)
}

class GameModel {

    
    
    // MARK:- variables & constants
    ///Keeps track of game timer.
    private let totalGameTime = 6
    var timeRemaining = 0
    var clockShouldBeRunning = false
    var timerIsRunning = false
    private var gameTimer: Timer?

    ///Keeps track of game score and high score.
    private let newGameScore = 0
    var currentScore = 0
    var highScore = 0
    var highScoreIsNew = false
    var answerIsCorrect = false
    var gameIsOver = false
    var oldWordsArray = ["BLUE", "RED", "YELLOW", "GREEN"]
    var wordsArray = ["BLUE", "RED", "YELLOW", "GREEN"]

    var delegate: GameDelegate?
    
    
    // MARK:- functions
    ///Game logic - Starts the clock. Increments points for correct selections. Ends game for incorrect selections.
    func playGame() {
        if answerIsCorrect == true && timerIsRunning == false {
            clockShouldBeRunning = true
        } else if answerIsCorrect == true && timerIsRunning == true {
            currentScore += 1
        } else if answerIsCorrect == false && timerIsRunning == true {
            endGame()
        } else if answerIsCorrect == false && timerIsRunning == false {
        }
    }
    
    
    
    ///Tracks and updates highscore variable when new high score is achieved.
    func updateHighScore() {
        if highScore < currentScore {
            highScore = currentScore
            highScoreIsNew = true
            UserDefaults.standard.set(highScore, forKey: "highScore")
        } else if highScore >= currentScore {
            highScoreIsNew = false
        }
    }
    
    
    
    ///Resets all variables and constants to initial settings.
    func startNewGame() {
        currentScore = newGameScore
        timeRemaining = totalGameTime
        answerIsCorrect = false
        timerIsRunning = false
        clockShouldBeRunning = false
        gameIsOver = false
    }
    
    
    
    ///Passes end game function for incorrect answer selection during game logic.
    private func endGame() {
        gameIsOver = true
    }

    
    
    ///Game timer logic.
    private func startTimer() {
        timerIsRunning = true
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.timeRemaining -= 1
            if  self.timeRemaining <= 0 {
                self.delegate?.gameOver()
            }
            
        }
    }
    
    
    ///Passes end of game data to score screen via segue.
    private func gameOver() {
        gameTimer?.invalidate()
        updateHighScore()
        startNewGame()

    }
    


}








