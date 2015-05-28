//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Kotaro Hirayama on 4/11/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import UIKit

class TodoTableViewController : UIViewController, UITableViewDataSource {
    var todo = TodoDataManager.sharedInstance
    var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        header.image = UIImage(named: "header")
        header.userInteractionEnabled = true // addSubViewが動くように
        
        let title = UILabel(frame: CGRect(x: 10, y: 20, width: 310, height: 44))
        title.text = "TODO LIST"
        header.addSubview(title)
        
        let button = UIButton.buttonWithType(.System) as! UIButton
        button.frame = CGRect(x: 320 - 50, y: 20, width: 50, height: 44)
        button.setTitle("+", forState: .Normal)
        button.addTarget(self, action:"showCreateView", forControlEvents: .TouchUpInside) // タップされたときに呼び出す関数を指定してる
        header.addSubview(button)
        
        let screenWidth = UIScreen.mainScreen().bounds.size.height
        self.tableView = UITableView(frame: CGRect(x: 0, y: 60, width: 320, height: screenWidth - 60))
        self.tableView!.dataSource = self
        
        self.view.addSubview(self.tableView!)
        self.view.addSubview(header)
    }
    func showCreateView() {
        
        let alert = UIAlertController(title: "add todo", message: nil, preferredStyle: .Alert)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
// プロトコルはextensionにするといい感じかも
extension TodoTableViewController : UITableViewDataSource {
    // UITableViewDataSourceのプロトコル
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todo.size
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel!.text = self.todo[row].title
        
        return cell
    }}

// 発見 & 調べる
// !の意味、振る舞い
// 多分、プロトコルとUIView系？は覚えるしかないな。リファレンス探す