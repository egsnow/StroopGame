//
//  ScoreScreenViewController.swift
//  Stroop Game
//
//  Created by Eric Snow on 10/26/18.
//  Copyright © 2018 Eric Snow. All rights reserved.
//

import UIKit

class ScoreScreenViewController: UIViewController {

    
    
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()







    }
    

    
    
    @IBAction func playAgainButton() {
        dismiss(animated: true, completion: nil)
    }

}
