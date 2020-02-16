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
    
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
    
        questionLabel.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

