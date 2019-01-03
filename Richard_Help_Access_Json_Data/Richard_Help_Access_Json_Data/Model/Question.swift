//
//  Question.swift
//  Richard_Help_Access_Json_Data
//
//  Created by Valentin on 19.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import Foundation
// struct is same as a class but:
// structs dont need initializiers, already has got a memberwise initializer
// structs functions must be mutating functions in a struct
// class has got designated initializer
// class is a reference type
// struct is
struct Question:Codable {
    let ID:String
    let Frage:String
    let Antwort1:String
    let Antwort2:String
    let Antwort3:String
    let Antwort4:String
    let Correct:String
    let Notiz:String?
    let LernsektorID:String
    let LerneinheitID:String
    let LernbereichID:String
    let SchwierigkeitID:String
    
    enum CodingKeys: String, CodingKey {
        case ID = "ID"
        case Frage = "Frage"
        case Antwort1 = "Antwort1"
        case Antwort2 = "Antwort2"
        case Antwort3 = "Antwort3"
        case Antwort4 = "Antwort4"
        case Correct = "Correct"
        case Notiz = "Notiz"
        case LernsektorID = "LernsektorID"
        case LerneinheitID = "LerneinheitID"
        case LernbereichID = "LernbereichID"
        case SchwierigkeitID = "SchwierigkeitID"
    }
    // functions must be mutating functions in a struct
    //
}
