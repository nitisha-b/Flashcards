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
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
    
        if(questionLabel.isHidden){
            questionLabel.isHidden = false
        }
        else{
            questionLabel.isHidden = true
        }
    }
    
    @IBAction func didTapBtn1(_ sender: Any) {
        btn1.isHidden = true
    }
    
    @IBAction func didTapBtn2(_ sender: Any) {
        questionLabel.isHidden = true
    }
    
    @IBAction func didTapBtn3(_ sender: Any) {
        btn3.isHidden = true
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


}

