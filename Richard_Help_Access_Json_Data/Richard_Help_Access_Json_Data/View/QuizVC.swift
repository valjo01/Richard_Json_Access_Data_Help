//
//  QuizVC.swift
//  Richard_Help_Access_Json_Data
//
//  Created by Valentin on 19.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    struct Question: Decodable {
        
        let ID: String?
        let Frage: String?
        let Antwort1: String?
        let Antwort2: String?
        let Antwort3: String?
        let Antwort4: String?
        let Correct: String?
        let Notiz: String?
        let LernsektorID: String?
        let LerneinheitID: String?
        let LernbereichID: String?
        let SchwierigkeitID: String?
        let Redakteur: String?
        let created_at: String?
        
    }
    
    // Outlets
    @IBOutlet weak var questionTextOutlet: UILabel!
    @IBOutlet weak var btnOutlet: UIButton!
    
    
    // Btns
    @IBAction func nextQuestionBtnAction(_ sender: UIButton) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:-- let & var
        let arrayQuestions = QuestionBank()
        
        
        
        
        // MARK:- JSON
        // JSON-----------------------------------------------------------------
        let url = "https://redaktion.pflegonaut.de/service.php"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) { (data, response, error) in
            do {
                var questionsJsonVar = try JSONDecoder().decode([Question].self, from: data!)
                //Ausgabe einer Frage
                print(questionsJsonVar[1].Frage!)
                
                // Anzahl der Fragen
                let countQuestion = questionsJsonVar.count - 1
                print("Anzahl entspricht \(countQuestion)")
                for index in 0...countQuestion {
                    var c = 1
                    print(c)
                    c = c + 1
                    
                }
                
                // Ausgabe aller questionsJsonVar
                for i in questionsJsonVar {
                    print(i)
                }
                
                
                

                
            } catch {
                print("we got an error")
            }
            }.resume()
        // JSON---------------------------------------------------------------
        
        // MARK:-- OutletConnection
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    

    
}
