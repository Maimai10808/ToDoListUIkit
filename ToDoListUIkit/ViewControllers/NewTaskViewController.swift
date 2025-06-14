//
//  NewTaskViewController.swift
//  ToDoListUIkit
//
//  Created by mac on 6/8/25.
//

//  This class represents the view controller responsible for presenting the "New Task" modal.
//  It handles the lifecycle of the modal, including setting up the modal view, adding it to the view hierarchy,
//  and dismissing the modal when the user taps the close button.
//
//  The NewTaskViewController also acts as the delegate for the NewTaskModelView, listening for close actions
//  from the modal view. It handles the dismissal of the modal when the close action is triggered.


import UIKit

protocol NewTaskDelegate: AnyObject {
    func closeView()
}

class NewTaskViewController: UIViewController {
    
    // modelView instantiate
    lazy var modelView: NewTaskModelView = {
        
        let modelWidth = view.frame.width - 30
        let modelHeight: CGFloat = 430
        let frame = CGRect(x: 15, y: view.center.y - (modelHeight / 2), width: modelWidth, height: modelHeight)
        // 正确创建 modelView 实例
        let modelView = NewTaskModelView(frame: frame)
        // 返回 modelView 实例，动画应在 addSubview 之后另写
        
        modelView.delegate = self
        return modelView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        modalTransitionStyle   = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        // modelView frame
        view.addSubview(modelView)

    }

}


//MARK: - Conformance to New Task Delegate
extension NewTaskViewController: NewTaskDelegate {
    func closeView() {
        dismiss(animated: true)
    }
}
