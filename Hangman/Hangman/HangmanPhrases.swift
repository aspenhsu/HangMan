//
//  HangmanPhrases.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import Foundation

class HangmanPhrases {
    
    var phrases : NSArray!
    
    // Initialize HangmanPhrase with an array of all possible phrases of the Hangman game
    init() {
        let path = Bundle.main.path(forResource: "phrases", ofType: "plist")
        phrases = NSArray.init(contentsOfFile: path!)
    }
    
    // Get random phrase from all available phrases
    func getRandomPhrase() -> String {
        let index = Int(arc4random_uniform(UInt32(phrases.count)))
        return phrases.object(at: index) as! String
    }
}

//public class thisPhrase {
//    
//    public var phrase : String
//    
//    init(phrase: String) {
//        self.phrase = phrase
//    }
//
//
//    func updateUnderscore() -> String {
//        var emptyString = ""
//        for i in self.phrase.characters {
//            if i == " " {
//                emptyString = emptyString + "   "}
//            else {
//                emptyString = emptyString + " _ "
//        }
//        }
//            return emptyString
//    }
//    
//    
//    func checkLetter(myCharacter: Character) -> Array<Int> {
//        var indexValue = 0
//        var indexArray = [Int]()
//            for i in self.phrase.characters {
//                if i == myCharacter{
//                    indexArray.append(indexValue)
//                    indexValue += 1
//                }
//        }
//    return indexArray
//    }
//    
//    
//    
//    func putLettersIn(myCharacter: Character, alreadyThere: String, indexedArray: Array<Int> ) -> String {
//        var chars = Array(alreadyThere.characters)
//        for i in indexedArray {
//            chars[i] = myCharacter
//        }
//        let modifiedString = String(chars)
//        return modifiedString
//    
//    }
//    
//    
//    func checkLetterTrue(myCharacter: Character) -> Bool {
//        var letterIsThere = false
//        for i in self.phrase.characters {
//            if i == myCharacter {
//            letterIsThere = true
//            }
//        }
//        return letterIsThere
//    }

    
    
    


