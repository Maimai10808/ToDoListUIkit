//
//  SettingsViewController.swift
//  ToDoListUIkit
//
//  Created by mac on 7/9/25.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTitleLabel: UILabel!
    
    @IBOutlet weak var appthemeLabel: UILabel!
    
    @IBOutlet weak var modalVIew: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTitleLabel.font = UIFont.style(.heading1)
        appthemeLabel.font = UIFont.style(.secondaryText)
        
        let window = UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        if let window = window {
            switch window.overrideUserInterfaceStyle {
            case .light:
                segmentedControl.selectedSegmentIndex = 0
            case .dark:
                segmentedControl.selectedSegmentIndex = 1
            case .unspecified:
                segmentedControl.selectedSegmentIndex = 2
           @unknown default :
                segmentedControl.selectedSegmentIndex = 2
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        modalVIew.layer.cornerRadius = 5
    }
    

    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        let window = UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        if sender.selectedSegmentIndex == 0 {
            // Light Mode
            window?.overrideUserInterfaceStyle = .light
        }
        else if sender.selectedSegmentIndex == 1 {
            // Dark Mode
            window?.overrideUserInterfaceStyle = .dark
        }
        else {
            // System Default
            window?.overrideUserInterfaceStyle = .unspecified
        }
    }
    
}
