//
//  TaskTableViewCell.swift
//  ToDoListUIkit
//
//  Created by mac on 6/7/25.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    static let identifier = "TaskTableViewCell"
    
    @IBOutlet weak var categoryContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryContainerView.layer.cornerRadius = categoryContainerView.frame.height / 2
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
