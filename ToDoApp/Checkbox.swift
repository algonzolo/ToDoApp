//
//  Checkbox.swift
//  ToDoApp
//
//  Created by Paul James on 07.09.2021.
//

import UIKit

class Checkbox: UIControl {

    private weak var imageView: UIImageView!
    
    private var image: UIImage {
        return checked ? UIImage(systemName: "checkmark.square.fill")! : UIImage(systemName: "square")!
    }
    
    @IBInspectable  // благодаря этому мы можем в сториборде переключать наш чек и анчек
    var checked: Bool = false {
        didSet {
            imageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // так мы создаем чекбокс который представлен картинкой
    private func setup(){
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        imageView.image = UIImage(systemName: "checkmark.square.fill")
        imageView.contentMode = .scaleAspectFit
        
        self.imageView = imageView
        
        backgroundColor = UIColor.clear // это надо для того чтобы мы видели только чекбокс и не видели белую коробку позади
        
        //настрйока переключения чека
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    @objc func touchUpInside(){
        checked = !checked
        
        //тепеь надо объяснить что значение поменялось
        sendActions(for: .valueChanged)
    }
    
}
