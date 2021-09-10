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
    
   // активирует зачеркивание текста
    @IBAction func checked(_ sender: Any) {
        updateChecked()
    }
    
    func setCell(title: String, checked: Bool){
        titlelabel.text = title
        set(checked: checked)
    }
    
    func set(checked: Bool) {
        checkbox.checked = checked
        updateChecked()
    }
    
    
    // тут делается зачеркивание текста
    func updateChecked() {
        let attributeString = NSMutableAttributedString(string: titlelabel.text!)
        
        if checkbox.checked {
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            
        } else {
            attributeString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributeString.length-1))
        }
        titlelabel.attributedText = attributeString
    }
    
    

  

}
