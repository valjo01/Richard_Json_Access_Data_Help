//
//  QuizVC.swift
//  Richard_Help_Access_Json_Data
//
//  Created by Valentin on 19.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var questionTextOutlet: UILabel!
    @IBOutlet weak var btnOutlet: UIButton!
    
    
    // Btns
    @IBAction func nextQuestionBtnAction(_ sender: UIButton) {
    }
    
    // MARK:-- let & var
    var countOfQuestions = 0
    
    // var questionBank = QuestionBank()
    
    
    // ALTERNATIVE ALS OBJEKTE ToDo

    var questionBank : [Question] = []
    
    var questionsJsonVar: [Question] = []
    static var questionObj : [Question] = []
    var counterForQuestionsJsonVarTest = 0
    var randNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- JSON
        // JSON-----------------------------------------------------------------
        let url = "https://redaktion.pflegonaut.de/service.php"
        let urlObj = URL(string: url)
        
        func jsonDataRequest () -> [Question]? {
            URLSession.shared.dataTask(with: urlObj!) { (data, response, error) in
                do {
                    
                    // Json to Array
                    self.questionsJsonVar = try JSONDecoder().decode([Question].self, from: data!)
                    self.countOfQuestions = self.questionsJsonVar.count
                    


                    DispatchQueue.main.async{
                        return self.questionsJsonVar
                    }
                    
                } catch {
                    print(error)
                }
                }.resume()
            return nil
        }
        // JSON---------------------------------------------------------------
        
        // MARK:-- OutletConnection
        jsonDataRequest()
        
        // -- Randomize Question Outlet
        let randNumber = Int.random(in: 1 ... self.countOfQuestions)
        print(self.questionsJsonVar[randNumber].Frage)
        questionTextOutlet.text = questionsJsonVar[randNumber].Frage
        
        

        // Do any additional setup after loading the view.
    }
    
}
