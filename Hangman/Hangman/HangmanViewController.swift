//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    @IBOutlet weak var EndingMessage: UILabel!
    
    @IBOutlet weak var wrongGuesses: UILabel!
    @IBOutlet weak var underscore_letters: UILabel!
    @IBOutlet weak var hangManImage: UIImageView!
    @IBOutlet weak var guesses: UITextField!
    var word: String = ""
    var viewedString: String = ""
    var mistakesMade = 0
    var lol: String = "wrong guesses:"
    var hangmanState = UIImage(named: "hangman1")
    @IBOutlet weak var finalShowDown: UILabel!
    
    @IBOutlet weak var CapitalSingle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        print(phrase)
        word = phrase
        //let instancePhrase: thisPhrase = thisPhrase(phrase: phrase)
        updateUnderscore()
        hangManImage.image = hangmanState
        wrongGuesses.text = lol
    }
    
    
    @IBAction func NEWGAME(_ sender: UIButton) {
        word = ""
        viewedString = ""
        mistakesMade = 0
        lol = "wrong guesses:"
        hangmanState = UIImage(named: "hangman1")
        viewDidLoad()
    }
    
    func wongame()  {
        
        // create the alert
        let alert = UIAlertController(title: "You won the game! The word was " + String(word), message: "Start Over", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
        word = ""
        viewedString = ""
        mistakesMade = 0
        lol = "wrong guesses:"
        hangmanState = UIImage(named: "hangman1")
        viewDidLoad()
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func lostgame()  {
        
        // create the alert
        let alert = UIAlertController(title: "You lost the game! The word was " + word, message: "Start Over", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
        word = ""
        viewedString = ""
        mistakesMade = 0
        lol = "wrong guesses:"
        hangmanState = UIImage(named: "hangman1")
        viewDidLoad()
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

    
    
    @IBAction func CheckGuess(_ sender: UIButton) {
        CapitalSingle.text = ""
        if guesses.text?.characters.count == 1 {
            let myGuess = Character(guesses.text!)
            doWork(guessed_character: myGuess)

        } else {
            CapitalSingle.text = "pls input single letters only"
        }
        guesses.text = ""
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUnderscore() {
        var f = 0
        var emptyString = "_ "
        for i in word.characters {
            if f == 0 {
                f+=1
                continue
            }
            if i == " " {
                emptyString = emptyString + "  "
                f += 1
            } else {
                emptyString = emptyString + "_ "
                f += 1
            }
        }
        viewedString = emptyString
        underscore_letters.text = viewedString
    }
    
    
    func checkLetterTrue(myCharacter: Character, phrase1: String) -> Bool {
        var letterIsThere = false
        for i in phrase1.characters {
            if i == myCharacter {
                letterIsThere = true
            }
        }
        return letterIsThere
    }
    
    
    
    func checkLetterArray(myCharacter: Character, phrase1: String) -> Array<Int> {
        var indexValue = 0
        var indexArray = [Int]()
        for i in phrase1.characters {
            if i == myCharacter{
                indexArray.append(indexValue)
            }
            indexValue += 1
        }
        return indexArray
    }
    
    
    func doWork(guessed_character: Character) {
        let k = checkLetterTrue(myCharacter: guessed_character , phrase1: word)
        if k == true {
            let helpfulArray = checkLetterArray(myCharacter: guessed_character , phrase1: word)
            update2(thisArray: helpfulArray, myCharacter: guessed_character, currentStanding: viewedString)
            
    }
        if (k == false) {
            mistakesMade += 1
            hangmanState = UIImage(named: "hangman" + String(mistakesMade + 1))
            hangManImage.image = hangmanState
            lol = lol + " " + String(guessed_character)
            wrongGuesses.text = lol
            if (mistakesMade + 1) == 7 {
                lostgame()
            }
            }
        }


    func update2(thisArray: Array<Int>, myCharacter: Character, currentStanding: String) {
        var characters: Array<Character> = Array(currentStanding.characters)
        for i in thisArray {
                characters[i*2] = myCharacter
        }
        if characters.contains("_"){
            viewedString = String(characters)
            underscore_letters.text = viewedString
        }else {
            viewedString = String(characters)
            underscore_letters.text = viewedString
            wongame()
        }
    
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

