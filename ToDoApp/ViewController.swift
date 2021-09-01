//
//  ViewController.swift
//  ToDoApp
//
//  Created by Albert Garipov on 30.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello"
        view.backgroundColor = .darkGray
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    


}

