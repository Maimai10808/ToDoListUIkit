//
//  NewTaskModelView.swift
//  ToDoListUIkit
//
//  Created by mac on 6/8/25.
//

//  This class defines the custom view that represents the modal view for adding a new task.
//  It includes all the UI components such as a description text view, category picker, and submit button.
//  This view also handles the layout and interactions within the modal view, as well as passing data and actions to the NewTaskViewController via a delegate.
//
//  The main purpose of this view is to manage the user interface for creating a new task, with appropriate interactions
//  such as clearing the placeholder text, handling picker view data, and delegating close actions to the controller.

import UIKit


import UIKit



class NewTaskModelView: UIView {

    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var categoryPickerView: UIPickerView!
    @IBOutlet private weak var submitButton: UIButton!
    
    @IBOutlet var contentView: UIView!
    
    var newTaskViewController : NewTaskViewController?
    weak var delegate: NewTaskDelegate?
    
    var caption: String {
        get {
            return descriptionTextView.text
        }
        set {
            descriptionTextView.text = newValue
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "NewTaskModelView", bundle: nil)
        nib.instantiate(withOwner: self)
        
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
        
        
        
        contentView.frame = bounds
        addSubview(contentView)
        
        print("✅ contentView is:", contentView!)
        
        
    }
    
    override func layoutSubviews() {
        contentView.layer.cornerRadius = 5
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        print("test to see if this is called")
//        
//    }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        delegate?.closeView()
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

