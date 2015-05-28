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
    var alert : UIAlertController?
    
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
    // タップされた時に呼び出される
    func showCreateView() {
        self.alert = UIAlertController(title: "add todo", message: nil, preferredStyle: .Alert)
        self.alert!.addTextFieldWithConfigurationHandler({ textField in
            textField.delegate = self
        })
        
        self.presentViewController(self.alert!, animated: true, completion: nil)
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
    }
}
extension TodoTableViewController : UITextFieldDelegate {
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        let todo = TODO(title: textField.text)
        if self.todo.create(todo) {
            textField.text = nil
            self.tableView!.reloadData()
        }
        // TODO: 入力はできてる？けど値が表示されないw
        // TODO: DEBUGの仕方知りたい！
        
        self.alert!.dismissViewControllerAnimated(false, completion: nil)
        return true
    }
}

// 発見 & 調べる
// !の意味、振る舞い
// 多分、プロトコルとUIView系？は覚えるしかないな。リファレンス探す