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
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var isCompleteImageView: UIImageView!
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryContainerView.layer.cornerRadius = categoryContainerView.frame.height / 2
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
    }
    
    //     •    withTask 是参数标签，显示函数的目的是什么（这里是配置任务）。
    // •    task 是你在函数内部使用的变量名称，用来引用传入的 Task 对象。
    // •    Task 是传入的参数类型，它是你传递给函数的实际数据类型。
    
    func configure(withTask task: Task) {
        categoryLabel.text = task.category.rawValue
        captionLabel.text = task.caption
        isCompleteImageView.image = task.isComplete ? UIImage(systemName: "checkmark.circle") :
        UIImage(systemName: "circle")
        dateLabel.text = dateFormatter.string(from: task.createdDate)
        
        selectionStyle = .none
        //     •    当用户点击 UITableViewCell 时，单元格不会显示任何选中效果，通常用来避免默认的选中背景色变化，保持单元格外观不变。
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ViewController: UITableViewDelegate {
    
}
