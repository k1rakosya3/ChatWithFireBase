//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progresBar: UIProgressView!
    @IBOutlet weak var nothingButton: UIButton!
    
//    var quizBrain = QuizBrain()
    var otherQuizBrain = OtherQuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = otherQuizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        otherQuizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func updateUI() {
        trueButton.setTitle(otherQuizBrain.getAnwerFirstElement(), for: .normal)
        falseButton.setTitle(otherQuizBrain.getAnwerSecondElement(), for: .normal)
        nothingButton.setTitle(otherQuizBrain.getAnwerThiretElement(), for: .normal)
        questionLabel.text = otherQuizBrain.getQuestionText()
        progresBar.progress = otherQuizBrain.getProgres()
        scoreLabel.text = "Score: \(otherQuizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        nothingButton.backgroundColor = UIColor.clear
    }
    
    
}

