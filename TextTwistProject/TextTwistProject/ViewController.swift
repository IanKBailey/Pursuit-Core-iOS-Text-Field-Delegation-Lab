//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var background: UIView!
    @IBOutlet weak var randomWordLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
 
    
    let selectedWord = Word.getRandomWord()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomWordLabel.text = selectedWord.scrambled
        textField.delegate = self
    }
    
    private func checkAnswer() {
        let guessed = (textField.text ?? "").lowercased()
        let userInput = Set(guessed)
        let correctAnswer = Set(selectedWord.unscrambled)
        
        if userInput.isSubset(of: correctAnswer) {
            if guessed.lowercased() == selectedWord.unscrambled {
                background.backgroundColor = .green
            }
            } else {
                background.backgroundColor = .red
        }
    }

    

    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    @IBAction func textFieldAction(_ sender: Any) {
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        for char in Word.randomWordArr(word: selectedWord) {
//            if textField.text == String(char) {
//
//            }
//        }
//    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkAnswer()
        textField.resignFirstResponder()
        return true
    }
}
