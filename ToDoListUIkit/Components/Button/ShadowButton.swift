//
//  ShadowButton.swift
//  ToDoListUIkit
//
//  Created by mac on 7/10/25.
//

import UIKit

class ShadowButton: UIButton {

    override  func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.font = UIFont.style(.secondaryText)
        backgroundColor = UIColor.link
    }
    
    override  func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override  func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0
        layer.shadowColor = UIColor.secondaryLink.cgColor
    }
    
    

}
