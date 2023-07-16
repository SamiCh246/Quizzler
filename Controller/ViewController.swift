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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        buttonOne.layer.cornerRadius = 0.1
        questionLabel.text = quizBrain.getQuestionText() //COMMAND + B to refresh code
        buttonOne.setTitle(quizBrain.getTitle1(), for: .normal)
        buttonTwo.setTitle(quizBrain.getTitle2(), for: .normal)
        buttonThree.setTitle(quizBrain.getTitle3(), for: .normal)
        progressBar.progress = quizBrain.getProgress()
//      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { *alternate method for time delay
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        self.buttonOne.backgroundColor = UIColor.clear
        self.buttonTwo.backgroundColor = UIColor.clear
        self.buttonThree.backgroundColor = UIColor.clear
        
    }
            
}

