//
//  Questions.swift
//  Milioner
//
//  Created by Bakhtiyar Pirizada on 21.10.24.
//

import Foundation
import UIKit
struct Questions {
    var question:String
    var answers: [Answer]
}
struct Answer {
    var answer : String
    var bool : Bool
    var color : UIColor = .white
    
}

