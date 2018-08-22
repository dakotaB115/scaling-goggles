//
//  main.swift
//  Guessing app
//
//  Created by Dakota Brown on 8/16/18.
//  Copyright © 2018 Dakota Brown. All rights reserved.
//

import Foundation

var i = true

let hello = """
I'm thinking of a number between 0 and 1000.
Try and guess what I am thinking.
"""

let left = "Guesses left:"

repeat {
    let rand = Int(arc4random_uniform(1001))
    var guessLeft = 5
    print("The random number is: \(rand)")
    print(hello)
    
    var guess = Int(readLine()!)
    
    while guess == nil {
        print("Enter a number")
        guess = Int(readLine()!)
    }
    if guess == rand {
        print("You got it right with \(guessLeft) guesses left")
        print("Do you want to pay again? Y/N")
        
        var playAgain = readLine()!.uppercased()
        
        while playAgain != "Y" && playAgain != "N" {
            print("Do you want to pay again? Y/N")
            playAgain = readLine()!.uppercased()
        }
        
        if playAgain == "N" {
            print("Thanks for playing")
            i = false
        }
    } else {
        while guessLeft > 1 {
            if guess != rand {
                if guess! > rand {
                    print("Guess too high, try again.")
                    guessLeft = guessLeft - 1
                    print(left, guessLeft)
                    guess = Int(readLine()!)
                } else if guess! < rand {
                    print("Guess too low, try again")
                    guessLeft = guessLeft - 1
                    print(left, guessLeft)
                    guess = Int(readLine()!)
                }
            }
            if guessLeft == 1 && guess != rand {
                print("You lose, the correct number was: \(rand).")
                print("Do you want to pay again? Y/N")
                
                var playAgainAlt = readLine()!.uppercased()
                while playAgainAlt != "Y" && playAgainAlt != "N" {
                    print("Do you want to pay again? Y/N")
                    playAgainAlt = readLine()!.uppercased()
                }
                
                if playAgainAlt == "N" {
                    print("Thanks for playing")
                    i = false
                }
            }
        }
    }
} while i == true
