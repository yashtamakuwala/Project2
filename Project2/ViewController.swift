//
//  ViewController.swift
//  Project2
//
//  Created by Yash Tamakuwala on 03/09/16.
//  Copyright © 2016 Yash Tamakuwala. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func askQuestion(action: UIAlertAction! = nil){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]

        button1.setImage(UIImage(named : countries[0]), for: UIControlState.normal)
        button2.setImage(UIImage(named : countries[1]), for: UIControlState.normal)
        button3.setImage(UIImage(named : countries[2]), for: UIControlState.normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let alert = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Continue", style: .default, handler: askQuestion) // we want the game to continue when the button is tapped, so we pass in askQuestion so that iOS will call our askQuestion() method.
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
}

