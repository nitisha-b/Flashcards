//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Nitisha on 2/29/20.
//  Copyright © 2020 Nitisha Bhandari. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        flashcardsController.updateFlashcard(question: questionTextField.text!, answer1: answer1.text!, answer2: answer2.text!, answer3: answer3.text!, rightAnswer: rightAnswer.text!)
        
        dismiss(animated: true)
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
