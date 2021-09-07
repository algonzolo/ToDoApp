//
//  CustomTableViewCell.swift
//  ToDoApp
//
//  Created by Paul James on 05.09.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var checkbox: Checkbox!
    
    @IBAction func checked(_ sender: Any) {
    }
    
    func setCell(title: String, checked: Bool){
        titlelabel.text = title
        checkbox.checked = checked
        updateChecked()
    }
    
    
    func updateChecked(){
        let attributeString = NSMutableAttributedString(string: titlelabel.text!)
        
        if checkbox.checked {
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length-1))
        } else {
            attributeString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributeString.length-1))

        }
        
        titlelabel.attributedText = attributeString
    }
  

}
