//
//  QuizTimeVC.swift
//  SwiftLearning
//
//  Created by Mastermind on 10/3/15.
//  Copyright © 2015 Mohanad. All rights reserved.
//

import Foundation

import UIKit
// Class inheritance denoted by ':', protocols are also
class QuizTimeVC : UIViewController
{
    
    // Fibonacci numbers
    var number = 0
    
    // Questions and answers
    var questions = ["Who helps baby mario in Yoshi's Island?", "Who is smarter, Mario or Luigi?", "Who is smaller, Donkey Kong or Diddy Kong?"];
    var answers = ["Yoshi","Mario", "Diddy"];
    
    // Possible Selections
    var selections1 = ["Yoshi", "Luigi", "Donkey Kong"];
    var selections2 = ["Bowser", "Mario", "Diddy Kong"];
    
    // Number of Right/Wrong
    var numberOfCorrectChoises = 0;
    var numberOfWrongChoices = 0;

    // Outlets to Buttons
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var Choice1Label: UILabel!
    @IBOutlet weak var Choice2Label: UILabel!
    @IBOutlet weak var ButtonStart: UIButton!
    
    @IBOutlet weak var GradeLabel: UILabel!
    
    
    @IBAction func StartTouched(sender: AnyObject) {
        if(number > 2){
            number = 0;
        }
        QuestionLabel.text = questions[number];
        Choice1Label.text = selections1[number];
        Choice2Label.text = selections2[number];
        number++;
        //ButtonStart.enabled = false;
    }
    // Checks a users answer
    func checkAnswer(questionNumber:Int,selectedAnswer:String){
        
        let properAnswer = answers[questionNumber];
        
        let isCorrect = properAnswer == selectedAnswer;
        
        if(isCorrect == true){
            numberOfCorrectChoises++;
            	
        }else{
            numberOfWrongChoices++;
        }
    }
}