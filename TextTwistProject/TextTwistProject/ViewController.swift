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
    @IBOutlet weak var reset: UIButton!
    
    
    var selectedWord = Word.getRandomWord()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomWordLabel.text = selectedWord.scrambled
        textField.delegate = self
        reset.isHidden = true
        reset.isEnabled = false
    }
    
    private func checkAnswer() {
        let guessed = (textField.text ?? "").lowercased()
        let userInput = Set(guessed)
        let correctAnswer = Set(selectedWord.unscrambled)
        
        if userInput.isSubset(of: correctAnswer) {
            if guessed.lowercased() == selectedWord.unscrambled {
                background.backgroundColor = .green
                reset.isHidden = false
                reset.isEnabled = true
            }
            } else {
                background.backgroundColor = .red
        }
    }

    

    @IBAction func resetButton(_ sender: UIButton) {
        selectedWord = Word.getRandomWord()
        randomWordLabel.text = selectedWord.scrambled
        reset.isHidden = true
        reset.isEnabled = false
        background.backgroundColor = .white
        textField.text = ""
    }
    
    @IBAction func textFieldAction(_ sender: Any) {
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         var label: [Character] = Array(randomWordLabel.text ?? "")
        for (index, char) in label.enumerated() {
            if char == Character(string) {
                label.remove(at: index)
                randomWordLabel.text = String(label)
            }
            
            
            
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkAnswer()
        textField.resignFirstResponder()
        return true
    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//    }
//
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return true
//    }
    
    
}
