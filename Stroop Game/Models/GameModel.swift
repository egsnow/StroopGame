//
//  GameModel.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/29/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func resetGameLabels(timeRemaining: Int)
    func gameOver()
    func updateTimerLabel(timeRemaining: Int)
}

class GameModel {
    
    // MARK:- variables & constants
    ///Keeps track of game timer.
    private let totalGameTime = 15
    var timeRemaining = 0
    var timerIsRunning = false
    private var gameTimer: Timer?

    ///Keeps track of game score and high score.
    var delegate: GameDelegate?
    private let newGameScore = 0
    var currentScore = 0
    var highScore = 0
    var highScoreIsNew = false
    var answerIsCorrect = false
    var oldXmasWordsArray: [String]
    var xmasWordsArray: [String]
    
    init(words: [String]) {
        self.xmasWordsArray = words
        self.oldXmasWordsArray = words
    }
    
    // MARK:- functions
    ///Game logic - Starts the clock. Increments points for correct selections. Ends game for incorrect selections.
    func playGame() {
        if answerIsCorrect == true && timerIsRunning == false {
            startTimer()
            playSound("bip")
        } else if answerIsCorrect == true && timerIsRunning == true {
            currentScore += 1
            playSound("correct")
        } else if answerIsCorrect == false && timerIsRunning == true {
            endGame()
            playSound("error")
        } else if answerIsCorrect == false && timerIsRunning == false {
        }
    }
    
    ///Tracks and updates highscore variable when new high score is achieved.
    func updateHighScore() {
        if highScore < currentScore {
            highScore = currentScore
            highScoreIsNew = true
            playSound("fonfar")
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
        delegate?.resetGameLabels(timeRemaining: timeRemaining)
    }
    
    ///Passes end game function for incorrect answer selection during game logic.
    private func endGame() {
        gameTimer?.invalidate()
        updateHighScore()
        delegate?.gameOver()
    }

    ///Game timer logic.
    private func startTimer() {
        timerIsRunning = true
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.timeRemaining -= 1
            self.delegate?.updateTimerLabel(timeRemaining:
                self.timeRemaining)
            if  self.timeRemaining <= 0 {
                self.endGame()
            }
        }
    }
}








