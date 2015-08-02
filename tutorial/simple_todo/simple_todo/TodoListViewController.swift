//
//  TodoListViewController.swift
//  simple_todo
//
//  Created by Kotaro Hirayama on 7/24/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {

    let TodoCellHeight: CGFloat = 44
    let TodoCreateStoryboardName = "TodoCreate"
    let TodoCreateSegueIdentifier = "TodoCreateVC"
    
    // @IBOutletでstoryboardと紐付け
    @IBOutlet var todoTableView: UITableView!
    
    var todoModels = [TodoModel]() {
        // didSet - buildinMethod
        didSet {
            todoTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        let todoModel0 = TodoModel(title: "TODO0", completed: true)
        let todoModel1 = TodoModel(title: "TODO1", completed: false)
        todoModels = [todoModel0, todoModel1]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // cellの行数
        return todoModels.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { // cellの内容反映
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoModels[indexPath.row].title
        return cell
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TodoCellHeight
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) { // IndexPath付きで選択されたとき
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectTodo = todoModels[indexPath.row]
        
        let storyboard: UIStoryboard = UIStoryboard(name: TodoCreateStoryboardName, bundle: NSBundle.mainBundle())
        let todoCreateVC = storyboard.instantiateViewControllerWithIdentifier(TodoCreateSegueIdentifier) as! TodoCreateViewController
        todoCreateVC.delegate = self
        todoCreateVC.todoModel = selectTodo
        todoCreateVC.title = "todo"
        
        navigationController?.pushViewController(todoCreateVC, animated: true)
    }
}

extension TodoListViewController: TodoCreateViewControllerDelegate {
    // 自分でmethod定義してTodoCreateViewControllerから叩くのもあり
    func updateTodoListTitle() {
        todoTableView.reloadData()
    }
}