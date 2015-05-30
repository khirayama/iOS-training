//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Kotaro Hirayama on 4/11/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//
import UIKit

enum TodoAlertViewType {
    case Create, Update(Int), Remove(Int)
}

class TodoTableViewController : UIViewController {
    
    var todo = TodoDataManager.sharedInstance
    
    var alert : UIAlertController?
    var alertType : TodoAlertViewType?
    
    var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        header.image = UIImage(named:"header")
        header.userInteractionEnabled = true // addSubViewが動くように
        
        let title = UILabel(frame: CGRect(x: 10, y: 20, width: 310, height: 44))
        title.text = "TODO"
        header.addSubview(title)
        
        let button = UIButton.buttonWithType(.System) as! UIButton
        button.frame = CGRect(x: 320 - 50, y: 20, width: 50, height: 44)
        button.setTitle("ADD", forState: .Normal)
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
        
        self.alertType = TodoAlertViewType.Create
        
        self.alert = UIAlertController(title: "ADD TODO ITEM", message: nil, preferredStyle: .Alert)
        
        self.alert!.addTextFieldWithConfigurationHandler({ textField in
            textField.delegate = self
            textField.returnKeyType = .Done
        })
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        self.alert!.addAction(okAction)
        
        self.presentViewController(self.alert!, animated: true, completion: nil)
    }
    
}

extension TodoTableViewController : UITextFieldDelegate {
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        if let type = self.alertType {
            switch type {
            case .Create:
                let todo = TODO(title: textField.text)
                if self.todo.create(todo) {
                    textField.text = nil
                    self.tableView!.reloadData()
                }
            case let .Update(index):
                let todo = TODO(title: textField.text)
                if self.todo.update(todo, at:index) {
                    textField.text = nil
                    self.tableView!.reloadData()
                }
            case let .Remove(index):
                break
            }
        }
        
        self.alert!.dismissViewControllerAnimated(false, completion: nil)
        return true
    }
}

extension TodoTableViewController : TodoTableViewCellDelegate {
    
    func updateTodo(index: Int) {
        self.alertType = TodoAlertViewType.Update(index)
        
        self.alert = UIAlertController(title: "EDIT", message: nil, preferredStyle: .Alert)
        self.alert!.addTextFieldWithConfigurationHandler({ textField in
            textField.text = self.todo[index].title
            textField.delegate = self
            textField.returnKeyType = .Done
        })
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        self.alert!.addAction(okAction)
        
        self.presentViewController(self.alert!, animated: true, completion: nil)
    }
    
    func removeTodo(index: Int) {
        self.alertType = TodoAlertViewType.Remove(index)
        
        self.alert = UIAlertController(title: "DELETE", message: nil, preferredStyle: .Alert)
        self.alert!.addAction(UIAlertAction(title: "Delete", style: .Destructive) { action in
            self.todo.remove(index)
            self.tableView!.reloadData()
            })
        self.alert!.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.presentViewController(self.alert!, animated: true, completion: nil)
    }
}
// プロトコルはextensionにするといい感じかも?
extension TodoTableViewController : UITableViewDataSource {
    // UITableViewDataSourceのプロトコル
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todo.size
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = TodoTableViewCell(style: .Default, reuseIdentifier: nil)
        cell.delegate = self
        
        cell.textLabel?.text = self.todo[indexPath.row].title
        cell.tag = indexPath.row
        
        return cell
    }
}

// 発見 & 調べる
// !の意味、振る舞い
// 多分、プロトコルとUIView系？は覚えるしかないな。リファレンス探す
// DEBUGの仕方知りたい！