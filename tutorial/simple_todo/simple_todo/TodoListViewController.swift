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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // storyboardからctrl + d&dで追加した
    @IBOutlet var todoTableView: UITableView!
    
    // セルに表示するテキスト
    let todos = ["TODO0", "TODO1", "TODO2"]
}

extension TodoListViewController: UITableViewDataSource {
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    // セルの内容反映
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
}

// TODO:
// - Delegateないけどええん？
// - @IBOutlet var todoTableView: UITableView!ってd&d以外で追加できるのか
