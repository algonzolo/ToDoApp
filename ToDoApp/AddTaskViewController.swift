//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Paul James on 05.09.2021.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var selectedIndex: ToDoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedIndex != nil {
            textField.text = selectedIndex?.title
        }

        textField.backgroundColor = .white
        textField.textColor = .black
      
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if selectedIndex == nil {
            
            //save
            
            let newTask = ToDoList(context: context)
            newTask.title = textField.text
            
            do {
                try context.save()
                navigationController?.popViewController(animated: true)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            
            //update
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoList")
            
            do{
                let results = try context.fetch(request)
                for result in results{
                    let note = result as! ToDoList
                    if note == selectedIndex{
                        note.title = textField.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    
   

}
