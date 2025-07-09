//
//  ViewController.swift
//  ToDoListUIkit
//
//  Created by mac on 6/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    // Button
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.link
        button.tintColor = UIColor.white
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(1.4, 1.4, 1.4)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // titleView corner
        titleView.clipsToBounds = true
        titleView.layer.cornerRadius = 24
        titleView.layer.maskedCorners =
        [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        // tableView.dataSource
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 80
        
        // 创建一个 UITableView 并设置空的 footer view 来隐藏底部多余的空白区域
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        
        // 如果你想添加一个自定义的 footer 视图，可以像这样设置：
        //let footerView = UIView()
        // footerView.backgroundColor = .lightGray
        
        // Button
        view.addSubview(addButton)
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(createTask(_:)),
            name: NSNotification.Name("com.fullstacktuts.createTask"),
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(editTask(_:)),
            name: NSNotification.Name("com.fullstacktuts.editTask"),
            object: nil)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        let safeAreaBotton = view.safeAreaInsets.bottom
        let width: CGFloat = 60
        let height: CGFloat = 60
        let xPos = view.frame.width / 2 - width / 2
        let yPos = view.frame.height -  height - safeAreaBotton
        addButton.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        addButton.layer.cornerRadius = width / 2
        print("safe area \(view.safeAreaInsets.bottom)")
    }
    
   
    
    @objc func addButtonTapped() {
        let newTaskViewController = NewTaskViewController()
        present(newTaskViewController, animated: true)
    }
    
    @objc func editTask(_ notification: Notification)  {
        guard let userInfo = notification.userInfo,
              let taskToUpdate = userInfo["updateTask"] as? Task else {
            return
        }
        let taskIndex = tasks.firstIndex { task in
            task.id == taskToUpdate.id
        }
        guard let taskIndex = taskIndex else {
            return
        }
        tasks[taskIndex] = taskToUpdate
        tableView.reloadData()
    }
    
    @objc func createTask(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let task = userInfo["newTask"] as? Task else {
            return
        }
        
        //     •    提取通知中的数据：
        // 使用 notification.userInfo 获取通知中的数据，具体是 newTask 键对应的任务对象 task。如果提取失败，函数直接返回。
        
        tasks.append(task)
        tableView.reloadData()
    }
    
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "SettingSegue", sender: nil)
    }
    


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
        // as! TaskTableViewCell：此代码将获取到的单元格强制类型转换为 TaskTableViewCell，即你自定义的单元格类。这个强制转换是必要的，因为 dequeueReusableCell 方法返回的是 UITableViewCell 类型，你需要将其转换为 TaskTableViewCell 类型，以便能访问你在自定义单元格中定义的 UI 元素。
        cell.configure(withTask: task, delegate: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


extension ViewController: TaskTableViewCellDelegate {
    
    func editTask(id: String) {
        guard let taskIndex = tasks.firstIndex(where: { $0.id == id }) else { return }
        let task = tasks[taskIndex]
        
        let newTaskViewController = NewTaskViewController(task: task)
        present(newTaskViewController, animated: true)
    }
    
    func markTask(id: String, complete: Bool) {
        guard let taskIndex = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[taskIndex].isComplete = complete
        tableView.reloadData()
    }
}

