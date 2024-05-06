//
//  GameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var secondsLabel: UILabel!
    // interface connection/bridge for the score label and target label
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    // interface connection creating an array of buttons
    @IBOutlet var buttonsCollection: [UIButton]!
    // interface connection for the button action
    @IBAction func letterButtons(_ sender: UIButton) {
        gameBrain.letterSelected(selectedLetter: sender.titleLabel!.text!)
        updateUI()
    }
    
    var timer: Timer!
    let gameBrain = GameBrain.shared
    
    // view did load is the entry point to the app view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameBrain.newGame(numLetters: 9)
        
        updateUI()
        configureTimer()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
    }
    func updateUI() {
        // assign the target letter to the target label "text" to update the UI label
        targetLabel.text = gameBrain.targetLetter
        print("target label is \(targetLabel.text!)")
        
        // assign the score to the score label "text" to update the UI label
        scoreLabel.text = String(gameBrain.score)
        secondsLabel.text = String(gameBrain.secondsRemaining)
        
        // loop through IB outlet array of buttons
        for (index, buttonLetter) in buttonsCollection.enumerated() {
            // assign the random letter index position to the random letter
            print(gameBrain.randomLetters)
            let randomLetter = gameBrain.randomLetters[index]
            // set the UI title of each button to the random letter.
            buttonLetter.setTitle(randomLetter, for: .normal)
        }
        
    }
    
    func configureTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: fireTimer(timer:))
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func fireTimer(timer: Timer) {
        gameBrain.secondsRemaining -= 1
        updateUI()
        
        if gameBrain.secondsRemaining <= 0 {
            timer.invalidate()
        
            navigationController?.popViewController(animated: true)
        }
        
        
        
    }
    
    func calculateNewScore(selectedLetter: String) {
        // check if the selected letter is the same as the target letter. increment it by 1
        //        if selectedLetter == targetLetter {
        //            score += 1
        //        }
    }
    
    
}

