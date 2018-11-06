//
//  GameModel.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/29/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import Foundation



class GameModel {

    
    
    // MARK:- variables & constants
    ///Keeps track of game timer.
    let totalGameTime = 6
    var timeRemaining = 0
    var clockShouldBeRunning = false
    var timerIsRunning = false
    ///Keeps track of game score and high score.
    let newGameScore = 0
    var currentScore = 0
    var highScore = 0
    var highScoreIsNew = false
    var answerIsCorrect = false
    var gameIsOver = false
    var wordsArray = ["BLUE", "RED", "YELLOW", "GREEN"]

    
    
    
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
    func endGame() {
        gameIsOver = true
    }

    

}








