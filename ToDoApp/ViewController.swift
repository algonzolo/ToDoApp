//
//  ViewController.swift
//  ToDoApp
//
//  Created by Albert Garipov on 30.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todos = [ToDoList]()
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    // activate moving and delete cells
    @IBAction func activeMoveCell(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    
    //get data from core data
    
    func getData(){
        do{
            todos = try context.fetch(ToDoList.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    

}

extension ViewController: UITableViewDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let todo = todos[indexPath.row]
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            context.delete(todo)
            do{
                try context.save()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
    // allow moving cells
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editTask", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTask"{
            let indexPath = tableView.indexPathForSelectedRow!
            let detailVC = segue.destination as? AddTaskViewController
            detailVC?.selectedIndex = todos[indexPath.row]
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let todo = todos[indexPath.row]
        
        switch todo.priority {
        case 1:
            cell.titlelabel.text = "❗️" + todo.title!
        default:
            cell.titlelabel.text = "" + todo.title!
        }
        
        
        
        return cell
    }
    
    
}
