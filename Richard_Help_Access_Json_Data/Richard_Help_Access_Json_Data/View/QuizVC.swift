//
//  QuizVC.swift
//  Richard_Help_Access_Json_Data
//
//  Created by Valentin on 19.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    // MARK:-- let & var
    var countOfQuestions = 0
    var questionsJsonVar: [Question] = []
    var counterForQuestionsJsonVarTest = 0
    var randNumber = 1

    
    // priorities set
    // let queue = DispatchQueue(label: "Json loading", qos: .userInteractive)
    
    // Outlets
    @IBOutlet weak var questionTextOutlet: UILabel!
    @IBOutlet weak var btnOutlet: UIButton!
    
    // Btns
    @IBAction func nextQuestionBtnAction(_ sender: UIButton) {
    }
    @IBAction func refreshBtnTapped(_ sender: UIBarButtonItem) {
        
        let queue = DispatchQueue(label: "Json loading", qos: .userInteractive)
        
        self.btnOutlet.isEnabled = false
        
        func jsonDataRequest () {
            let url = "https://redaktion.pflegonaut.de/service.php"
            let urlObj = URL(string: url)
            URLSession.shared.dataTask(with: urlObj!) { (data, response, error) in
                do {
                    
                    // Json to Array
                    self.questionsJsonVar = try JSONDecoder().decode([Question].self, from: data!)
                    let countOfQuestions = self.questionsJsonVar.count
                    print(self.questionsJsonVar)
                    
                } catch {
                    print(error)
                }
                }.resume()
        }
        
        // first in queue
        queue.async {
            jsonDataRequest()
            

            // later in queue
            DispatchQueue.main.async {
                print("main.async")
//                // -- Randomize Question Outlet
//                print("Anzahl der Fragen" , self.countOfQuestions)
//                //let randNumber = Int.random(in: 1 ... self.countOfQuestions)
//                print(self.questionsJsonVar[0].Frage)
//                //self.questionTextOutlet.text = self.questionsJsonVar[self.randNumber].Frage
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Do any additional setup after loading the view.
}
