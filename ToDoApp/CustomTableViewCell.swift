//
//  CustomTableViewCell.swift
//  ToDoApp
//
//  Created by Paul James on 05.09.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titlelabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
