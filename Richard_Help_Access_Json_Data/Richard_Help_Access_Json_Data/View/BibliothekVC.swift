//
//  BibliothekVC.swift
//  Richard_Help_Access_Json_Data
//
//  Created by Valentin on 31.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import UIKit
import CoreData

class BibliothekVC: UIViewController //, UITableViewDelegate, UITableViewDataSource
{
    
    // MARK:-- Var & Let
    var questionsArray = [QuestionsCoreData]()
    
    // MARK:-- Btn
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func refreshQuestionListBtnAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func addQuestionBtnAction(_ sender: UIBarButtonItem) {
        createQuestions()
    }
    
    //MARK:-- Methods
    func createQuestions() {
        let alert = UIAlertController(title: "Frage hinzufügen", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (TextField) in
            TextField.placeholder = "Frage"
        }
        alert.addTextField { (TextField) in
            TextField.placeholder = "Antwort 1"
        }
        
        // "Hinzufügen" - tapped
        let action = UIAlertAction.init(title: "Hinzufügen", style: .default) { (_) in
            if alert.textFields?.first?.text?.count != 0 && alert.textFields?.last?.text?.count != 0 {
                let frage = alert.textFields?.first?.text
                let antwort1 = alert.textFields?.last?.text
                
                // CoreData
                let question = CoreDataService.defaults.createUserQuestionOnBtnTapped(_frage: frage!, _antwort1: antwort1!)
                
                // Array
                self.questionsArray.append(question)
                self.tableView.reloadData()
                
            } else {
                self.errorMessage(_message: "Bitte alle Felder eintragen")
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func errorMessage(_message: String) {
        let alert = UIAlertController(title: "Fehler", message: _message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func loadData() {
        let questionsArray = CoreDataService.defaults.loadData()
        
        if let _questionsArrray = questionsArray {
            self.questionsArray = _questionsArrray
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // nicht notwendig Objekte zu erstellen, da MVC mit Singleton Pattern
        // let coreObj = CoreDataService()
        
        // forbidden, because of private init in CoreDataService
        
        
    }
    
     // MARK: - Navigation
    
}


// MARK:-- Extensions
// Protocolls for tableView
extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionFrage", for: indexPath)

        return cell
    }
    
    
}
