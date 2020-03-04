//
//  ViewController.swift
//  Flashcards
//
//  Created by Nitisha on 2/15/20.
//  Copyright © 2020 Nitisha Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var card: UIView!
   
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var right: Int = 2
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
    
        if(questionLabel.isHidden){
            questionLabel.isHidden = false
        }
        else{
            questionLabel.isHidden = true
        }
    }
    
    /* This function gets the texts from all the text fields in the flashcard creator view controller.
     * It checks which answer the user has marked as the right one and changes the answer label accordingly.
     * It also changes the text in the buttons to the new answers in the order they were entered.
     */
    func updateFlashcard(question: String, answer1: String, answer2: String, answer3: String, rightAnswer: String) {
        
        // Unhide buttons and reset the question label to be on top
        btn1.isHidden = false
        btn2.isHidden = false
        btn3.isHidden = false
        questionLabel.isHidden = false
        
        questionLabel.text = question
        
        switch (Int(rightAnswer)) {
        
        case 1:
            answerLabel.text = answer1
            break
        case 2:
            answerLabel.text = answer2
            break
        case 3:
            answerLabel.text = answer3
            break
        default:
            answerLabel.text = answer1
        }
        
        btn1.setTitle(answer1, for: .normal)
        btn2.setTitle(answer2, for: .normal)
        btn3.setTitle(answer3, for: .normal)
        
        right = Int(rightAnswer)!
        
    }
    
    /* The buttons are coded to disappear by checking what the right answer is and
     * only the button that is correct will be unhidden.
     */
    @IBAction func didTapBtn1(_ sender: Any) {
        
        if (right == 2 || right == 3){
            btn1.isHidden = true
        }
        else if(right == 1){
            questionLabel.isHidden = true
        }
    }
    
    @IBAction func didTapBtn2(_ sender: Any) {
        
        if (right == 1 || right == 3){
            btn2.isHidden = true
        }
        else if(right == 2){
            questionLabel.isHidden = true
        }
    }
    
    @IBAction func didTapBtn3(_ sender: Any) {
        
        if (right == 1 || right == 2){
            btn3.isHidden = true
        }
        else if(right == 3){
            questionLabel.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Style Cards
        answerLabel.layer.cornerRadius = 20.0
        questionLabel.layer.cornerRadius = 20.0
        
        answerLabel.clipsToBounds = true
        questionLabel.clipsToBounds = true
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        btn1.layer.cornerRadius = 20.0
        btn1.layer.borderWidth = 3.0
        btn1.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        btn2.layer.cornerRadius = 20.0
        btn2.layer.borderWidth = 3.0
        btn2.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        btn3.layer.cornerRadius = 20.0
        btn3.layer.borderWidth = 3.0
        btn3.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // Set the flashcardsController property to self
        creationController.flashcardsController = self
    }
}

