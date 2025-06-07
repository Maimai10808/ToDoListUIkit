//
//  ViewController.swift
//  ToDoListUIkit
//
//  Created by mac on 6/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.clipsToBounds = true
        titleView.layer.cornerRadius = 24
        titleView.layer.maskedCorners =
        [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }


}

