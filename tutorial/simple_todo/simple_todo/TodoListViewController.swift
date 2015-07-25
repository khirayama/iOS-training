//
//  TodoListViewController.swift
//  simple_todo
//
//  Created by Kotaro Hirayama on 7/24/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import UIKit

// TableViewのときはUITableViewDataSource, UITableViewDelegateをプロトコルとして追加
class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    let TodoCellHeight: CGFloat = 44
    let TodoCreateStoryboardName = "TodoCreate"
    let TodoCreateSegueIdentifier = "TodoCreateVC"
    
    @IBOutlet var todoTableView: UITableView!
    let todos = ["TODO0", "TODO1", "TODO2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // cellの行数
        return todos.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { // cellの内容反映
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TodoCellHeight
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) { // IndexPath付きで選択されたとき
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectTodo = todos[indexPath.row]
        
        let storyboard: UIStoryboard = UIStoryboard(name: TodoCreateStoryboardName, bundle: NSBundle.mainBundle())
        let todoCreateVC = storyboard.instantiateViewControllerWithIdentifier(TodoCreateSegueIdentifier) as! TodoCreateViewController
        todoCreateVC.todoModel = selectTodo
        
        navigationController?.pushViewController(todoCreateVC, animated: true)
    }
}
