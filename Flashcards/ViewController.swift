//
//  ViewController.swift
//  Flashcards
//
//  Created by Nitisha on 2/15/20.
//  Copyright © 2020 Nitisha Bhandari. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var rightAnswer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var card: UIView!
   
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    // Array to store the flashcards
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    
    // Second button is the right answer on the first page
    var right: Int = 2
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
    
        if(questionLabel.isHidden){
            questionLabel.isHidden = false
        }
        else{
            questionLabel.isHidden = true
        }
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        // Decrease the index
        currentIndex = currentIndex - 1
        
        // Update the labels
        updateLabels()
        
        // Update the next/prev buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        // Increase the index
        currentIndex = currentIndex + 1
        
        // Update the labels
        updateLabels()
        
        // Update the buttons
        updateNextPrevButtons()
    }
    
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
        
        questionLabel.text = currentFlashcard.question
        
        switch (Int(currentFlashcard.rightAnswer)) {
        
        case 1:
            answerLabel.text = currentFlashcard.answer1
            break
        case 2:
            answerLabel.text = currentFlashcard.answer2
            break
        case 3:
            answerLabel.text = currentFlashcard.answer3
            break
        default:
            answerLabel.text = currentFlashcard.answer1
        }
        
        btn1.setTitle(currentFlashcard.answer1, for: .normal)
        btn2.setTitle(currentFlashcard.answer2, for: .normal)
        btn3.setTitle(currentFlashcard.answer3, for: .normal)
        
    }
    
    func updateNextPrevButtons(){
        
        // Disable the next button if the current index is at the end
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        
        // Disable the prev button if the current index is at the start
        if currentIndex == 0{
            prevButton.isEnabled = false
        }
        else{
            prevButton.isEnabled = true
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
        
         right = Int(rightAnswer)!
        
        let flashcard = Flashcard(question: question, answer1: answer1, answer2: answer2, answer3: answer3, rightAnswer: rightAnswer)
            
        // Adding flashcard in the flashcards array
        flashcards.append(flashcard)
        
        // Logging to the console
        print("Added new Flashcard")
        print("We now have \(flashcards.count) flashcards")
        
        // Update current index
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        // Update the next/prev buttons
        updateNextPrevButtons()
        
        // Update the labels
        updateLabels()
        
        // Save new flashcards to disk
        saveAllFlashcardsToDisk()
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
        
        readSavedFlashcards()
        
        // Add the initial flashcard only if the array is empty
        if flashcards.count == 0{
            updateFlashcard(question: "What does the fox say?", answer1: "Woof Woof", answer2: "Ring-ding-ding-dingeringeding", answer3: "Roar", rightAnswer: "2")
        }
        else{
             updateLabels()
            updateNextPrevButtons()
        }

        // Style Cards
        answerLabel.layer.cornerRadius = 20.0
        questionLabel.layer.cornerRadius = 20.0
        
        answerLabel.clipsToBounds = true
        questionLabel.clipsToBounds = true
        
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        btn1.layer.cornerRadius = 15.0
        btn1.layer.borderWidth = 1.5
        btn1.layer.borderColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        
        btn2.layer.cornerRadius = 15.0
        btn2.layer.borderWidth = 1.5
        btn2.layer.borderColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        
        btn3.layer.cornerRadius = 15.0
        btn3.layer.borderWidth = 1.5
        btn3.layer.borderColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        
    }
    
    func saveAllFlashcardsToDisk(){
        
        /* UserDefaults cannot store an array of Flashcard on disk, but knows how to store an
           array of dictionaries.
         */
        
        // Convert array of Flashcard into an array of dictionaries
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question" : card.question, "answer1": card.answer1, "answer2": card.answer2, "answer3": card.answer3, "rightAnswer": card.rightAnswer]
        }
        
        // Save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        // log it to console
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards(){
        
        // Read dictionaryArray from disk if it exists
        
        // if-let statement - check if a dictionary exists
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            // Convert from array of dictionaries to array of Flashcard
            // Force unwrap optionals - !
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer1: dictionary["answer1"]!, answer2: dictionary["answer2"]!, answer3: dictionary["answer3"]!, rightAnswer: dictionary["rightAnswer"]!)
            }
            
            // Add all these Flashcards in the flashcards array
            flashcards.append(contentsOf: savedCards)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // Set the flashcardsController property to self
        creationController.flashcardsController = self
        
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = questionLabel.text
            creationController.initialAnswer1 = btn1.currentTitle
            creationController.initialAnswer2 = btn2.currentTitle
            creationController.initialAnswer3 = btn3.currentTitle
            creationController.initialRightAnswer = String(right)
        }
    }
}

