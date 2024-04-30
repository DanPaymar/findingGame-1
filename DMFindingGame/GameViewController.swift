//
//  GameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

class GameViewController: UIViewController {
    
    // interface connection/bridge for the score label and target label
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    // interface connection creating an array of buttons
    @IBOutlet var buttonsCollection: [UIButton]!
    // interface connection for the button action
    @IBAction func letterButtons(_ sender: UIButton) {
        calculateNewScore(selectedLetter: sender.titleLabel!.text!)
        updateScoreLabel()
        newRound()
    }
    // variable declarations
    var targetLetter = "" // target letter as an empty string
    var randomLetters = [String]() // random letter as an array of strings
    var score = 0 // score as an integer
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    // view did load is the entry point to the app view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        // randomize the letters array and assign it to the target letter
        targetLetter = letters.randomElement()!
        print(targetLetter)
        // generate 9 random letters for each button and assign them to the random letter array
        randomLetters = generateRandomLetters(numLetters: 9)
        // invoke the functions to update the UI labels
        updateTargetLetterLabel()
        updateLetterButtons()
        updateScoreLabel()
    }
    
    func generateRandomLetters(numLetters: Int) -> [String] {

        // create a new array of letters with the target letter
        var arrayLetters: [String] = [targetLetter]
        
        // loop over the number of letters
        for _ in 1..<numLetters {
            arrayLetters.shuffle()
            // declare a variable to get a random letter
            var randomLetter = letters.randomElement()!
            // loop over the array of letters. If it contains the random letter, get another random letter.
            while arrayLetters.contains(randomLetter) {
                randomLetter = letters.randomElement()!
            }
            // add a random letter to the array of letters
            arrayLetters.append(randomLetter)
        }
        print(arrayLetters)
        return arrayLetters
    }

    
    func calculateNewScore(selectedLetter: String) {
        // check if the selected letter is the same as the target letter. increment it by 1
        if selectedLetter == targetLetter {
            score += 1
        }
    }
    
    func updateTargetLetterLabel() {
        // assign the target letter to the target label "text" to update the UI label
        targetLabel.text = targetLetter
        print("target label is \(targetLabel.text!)")
    }
    
    func updateScoreLabel() {
        // assign the score to the score label "text" to update the UI label
        scoreLabel.text = String(score)
    }
    
    func updateLetterButtons() {
        // loop through IB outlet array of buttons
        for (index, buttonLetter) in buttonsCollection.enumerated() {
            // assign the random letter index position to the random letter
            let randomLetter = randomLetters[index]
            // set the UI title of each button to the random letter.
            buttonLetter.setTitle(randomLetter, for: .normal)
        }
    }
}

