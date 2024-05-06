//
//  StartViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import UIKit

class StartViewController: UIViewController {
    
    let gameBrain = GameBrain.shared
    
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        highScoreLabel.text = "High Score: \(gameBrain.score)"
    
    
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGame", sender: self)
        print("start button pressed")
    }
    
    @IBAction func startMediumButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToMedium", sender: self)
    }
    
    @IBAction func startHardButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToHard", sender: self)
    }
    
    
}
