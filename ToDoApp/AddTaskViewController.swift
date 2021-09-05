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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var selectedPriority: ToDoList?
    var selectedIndex: ToDoList?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedIndex != nil {
            textField.text = selectedIndex?.title
        }

        textField.backgroundColor = .white
        textField.textColor = .black
      
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        
        if selectedIndex == nil {
            
            //save
            
            let newTask = ToDoList(context: context)
            newTask.title = textField.text
            newTask.priority = Int32(segmentedControl.selectedSegmentIndex)
            
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
                        note.priority = Int32(segmentedControl.selectedSegmentIndex)
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
