//
//  NewTaskViewController.swift
//  ToDoListUIkit
//
//  Created by mac on 6/8/25.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    // modelView instantiate
    lazy var modelView: NewTaskModelView = {
        let modelView = UINib(nibName: "NewTaskModelView", bundle: nil).instantiate(withOwner: nil)[0]
        as! NewTaskModelView
        
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
        
        // 设置初始透明度为 0（不可见）
        modelView.alpha = 0
        
        let modelWidth = view.frame.width - CGFloat(30)
        let modelHeight: CGFloat = 430
        modelView.frame = CGRect(x: 15, y: view.center.y - (modelHeight / 2), width: modelWidth, height: modelHeight)
        
        // 动画淡入显示
            UIView.animate(withDuration: 0.3) {
                self.modelView.alpha = 1
            }
        
        
    }
    

    
}
