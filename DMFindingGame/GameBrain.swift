//
//  GameBrain.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import Foundation

class GameBrain {
    
    static let shared = GameBrain()
    
    var targetLetter: String = ""
    var randomLetters: [String] = []
    var numLetters: Int = 0
    var score: Int = 0
    var highScore: Int = 0
    var secondsRemaining: Int = 30
    var letters: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    func generateRandomLetters() -> [String] {
 
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
    
    func newRound() {
            // randomize the letters array and assign it to the target letter
            targetLetter = letters.randomElement()!
          
            // generate 9 random letters for each button and assign them to the random letter array
            randomLetters = generateRandomLetters()
        }
    
    func newGame(numLetters: Int) {
        score = 0 // reset the score to 0
        secondsRemaining = 30 // reset time to 30
        
        self.numLetters = numLetters
        
        newRound() // invoke the new round
    }
    
    func letterSelected(selectedLetter: String) {
        if selectedLetter == targetLetter {
            score += 1
            if score > highScore {
                highScore = score
            }
        }
        newRound()
    }
}


