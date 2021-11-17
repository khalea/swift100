//
//  ViewController.swift
//  Project2
//
//  Created by Khalea Berry on 11/17/21.
//

import UIKit

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
        
        button1.imageView?.layer.borderWidth = 1.0
        button1.imageView?.layer.borderColor = UIColor.black.cgColor
        button2.imageView?.layer.borderWidth = 1.0
        button2.imageView?.layer.borderColor = UIColor.black.cgColor
        button3.imageView?.layer.borderWidth = 1.0
        button3.imageView?.layer.borderColor = UIColor.black.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) — Score: \(score)"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct!"
            score+=1
        } else {
            title = "Wrong!"
            score-=1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

