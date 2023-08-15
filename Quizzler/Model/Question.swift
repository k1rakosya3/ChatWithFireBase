//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Admin on 04.05.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let taxt: String
    let answer: String
 
    
    init(q: String, a: String) {
        self.taxt = q
        self.answer = a
    }
    
}
