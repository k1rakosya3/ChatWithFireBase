//
//  OtherQuestion.swift
//  Quizzler-iOS13
//
//  Created by Admin on 06.05.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct OtherQuestion {
    
    let taxt: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.taxt = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
    
}
