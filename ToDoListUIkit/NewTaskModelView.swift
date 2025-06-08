//
//  NewTaskModelView.swift
//  ToDoListUIkit
//
//  Created by mac on 6/8/25.
//

import UIKit

class NewTaskModelView: UIView {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // descriptionTextView
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.text = "Add caption.."
        descriptionTextView.textColor = UIColor.lightGray
        
        
        descriptionTextView.delegate = self
        
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        
        // categoryPickerView middleRow
        let middleRow = Category.allCases.count / 2
           categoryPickerView.selectRow(middleRow, inComponent: 0, animated: false)
        categoryPickerView.selectRow(1, inComponent: 0, animated: false)
        
        
        layer.cornerRadius = 5
    }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
    }
    
}

// placeholder
extension NewTaskModelView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add caption..."
            textView.textColor = UIColor.lightGray
        }
    }
}

extension NewTaskModelView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.allCases.count
    }
}

extension NewTaskModelView: UIPickerViewDelegate {
    
    // titleForRow
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let category = Category.allCases[row]
        return category.rawValue
        
//        switch category {
//        case .excercise:
//            return "Excercise"
//        case .study:
//            return "Study"
//        case .work:
//            return "Work"
//        }
        
    }
    
    // titleForRow
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel: UILabel? = view as? UILabel
        
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
                    pickerLabel?.textAlignment = .center
        }
        
        let category = Category.allCases[row]
            pickerLabel?.text = category.rawValue

            return pickerLabel!
    }
    
    
}
