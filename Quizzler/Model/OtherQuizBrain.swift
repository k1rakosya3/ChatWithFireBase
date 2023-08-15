//
//  OtherQuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Admin on 06.05.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct OtherQuizBrain {
    
    var otherQuiz = [
        OtherQuestion(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        OtherQuestion(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        OtherQuestion(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        OtherQuestion(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        OtherQuestion(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        OtherQuestion(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        OtherQuestion(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        OtherQuestion(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        OtherQuestion(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        OtherQuestion(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == otherQuiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
        
    }
    
    func getQuestionText() -> String {
        
        return otherQuiz[questionNumber].taxt
    }
    
    func getProgres() -> Float {
        let progress = Float(questionNumber) / Float(otherQuiz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < otherQuiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getAnwerFirstElement() -> String {
        let firstAnswer = otherQuiz[questionNumber].answer[0]
        return firstAnswer
    }
    
    func getAnwerSecondElement() -> String {
        let secondAnswer = otherQuiz[questionNumber].answer[1]
        return secondAnswer
    }
    
    func getAnwerThiretElement() -> String {
        let thirtAnswer = otherQuiz[questionNumber].answer[2]
        return thirtAnswer
    }
    
}
