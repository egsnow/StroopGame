//
//  StartScreenViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 11/16/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pickerData[row]) Seconds"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gameTime = pickerData[row]
        return timePickerTextField.text = "\(pickerData[row]) Seconds"
    }
    
    @IBOutlet weak var gameLogo: UILabel!
    @IBOutlet weak var gameHighScore: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timePickerTextField: UITextField!
    
    let highscore = UserDefaults.standard.integer(forKey: "highScore")
    
    let pickerData = [5, 10, 15, 30]
    var gameTime = 10
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timerPicker = UIPickerView()
        timerPicker.delegate = self
        timerPicker.selectRow(1, inComponent: 0, animated: false)
        timePickerTextField.inputView = timerPicker
        
        gameLogo.font = gameLogo.font.withSize(gameLogo.frame.height * 7/8)
        gameHighScore.text = "High Score: \(highscore)"
        UIView.animate(withDuration: TimeInterval(1.0), delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.startButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? GameViewController {
            nextVC.gameTime = self.gameTime
        }
    }
    
    
    
    
    

}
