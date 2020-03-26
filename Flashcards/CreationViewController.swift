//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Nitisha on 2/29/20.
//  Copyright © 2020 Nitisha Bhandari. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var initialQuestion: String?
    var initialAnswer1: String?
    var initialAnswer2: String?
    var initialAnswer3: String?
    var initialRightAnswer: String?
    
    var flashcardsController: ViewController!
   
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    @IBOutlet weak var answer3: UITextField!
    @IBOutlet weak var rightAnswer: UITextField!
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionTextField.text = initialQuestion
        answer1.text = initialAnswer1
        answer2.text = initialAnswer2
        answer3.text = initialAnswer3
        rightAnswer.text = initialRightAnswer
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questionTextField.text
        let answer1Text = answer1.text
        let answer2Text = answer2.text
        let answer3Text = answer3.text
        let rightText = rightAnswer.text
        
        // Check if the text field are empty
        if(questionText == nil || answer1Text == nil || answer2Text == nil || answer3Text == nil || rightText == nil || questionText!.isEmpty || answer1Text!.isEmpty || answer2Text!.isEmpty || answer3Text!.isEmpty || rightText!.isEmpty){
            
            // Show error
            let alert = UIAlertController(title: "Missing Text", message: "Please fill out all the text fields", preferredStyle: .alert)
            
            // Ignore handler because clicking Ok will dismiss the message
            let okAction = UIAlertAction(title: "Ok", style: .default)
        
            alert.addAction(okAction)
            present(alert, animated: true)
        }
            
        else{
            var isExisting = false
            
            if (initialQuestion != nil) {
                isExisting = true
            }
            
            flashcardsController.updateFlashcard(question: questionText!, answer1: answer1Text!, answer2: answer2Text!, answer3: answer3Text!, rightAnswer: rightText!, isExisting: isExisting)
            
            dismiss(animated: true)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
