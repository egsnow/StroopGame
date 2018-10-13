//
//  ViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/12/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boxTL: UIView!
    @IBOutlet weak var boxTR: UIView!
    @IBOutlet weak var boxBL: UIView!
    @IBOutlet weak var boxBR: UIView!
    @IBOutlet weak var colorWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var myScore = 0
    var myAnswer = true
    
    @IBAction func button0(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
        backgroundColor()
        updateLabel()
        updateScore()
    }
    
    @IBAction func button1(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
        backgroundColor()
        updateLabel()
        updateScore()
    }
    
    @IBAction func button2(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
        backgroundColor()
        updateLabel()
        updateScore()
    }
    
    @IBAction func button3(_ sender: UIButton) {
        answerButton(buttonPressed: sender)
        backgroundColor()
        updateLabel()
        updateScore()
    }
    
    var colorsArray = [#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
    var wordsArray = ["BLUE", "RED", "YELLOW", "GREEN"]
    
    
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
        print("\(colorsArray[0])")
    }
    
    
    
    func answerButton(buttonPressed: UIButton) {
        if buttonPressed.backgroundColor == colorsArray[0] {
            myAnswer = true
        } else {
            myAnswer = false
        }
        
    }
    
    
    func updateScore() {
        if myAnswer == true {
            myScore += 1
        } else {
            myScore -= 1
        }
        scoreLabel.text = "Score: \(myScore)"
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorWordLabel.text = "START"
        backgroundColor()
        colorWordLabel.textColor = colorsArray[0]
        print("\(colorsArray[0])")

    }


}

