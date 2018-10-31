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
    var highScore = 0
    var timerIsRunning = false
    var myTimer = 10
    var myScore = 0
    var myAnswer = false
    var wordsArray = ["BLUE", "RED", "YELLOW", "GREEN"]
    var clockShouldBeRunning = false
    var gameIsOver = false
    
    
    
    // MARK:- functions
    //HAS THE GAME STARTED?
    func playGame() {
        if myAnswer == true && timerIsRunning == false {
            clockShouldBeRunning = true
        } else if myAnswer == true && timerIsRunning == true {
            gameScore()
        } else if myAnswer == false && timerIsRunning == true {
            endGame()
        } else if myAnswer == false && timerIsRunning == false {
        }
    }
    
    
    
    //HIGHSCORE
    func updateHighScore() {
        if highScore < myScore {
            highScore = myScore
        }
    }
    
    
    
    //GAME SCORE
    func gameScore() {
        if myAnswer == true {
            myScore += 1
        }
    }
    
    
    
    //NEW GAME
    func startNewGame() {
        myScore = 0
        myTimer = 10
        myAnswer = false
        timerIsRunning = false
        clockShouldBeRunning = false
        updateHighScore()
        gameIsOver = false
    }
    
    
    
    //GAME OVER
    func endGame() {
        gameScore()
        updateHighScore()
        gameIsOver = true
    }

    

}








