//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sami Sajjad Cheema on 7/15/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        options = a
        answer = correctAnswer
    }
}
