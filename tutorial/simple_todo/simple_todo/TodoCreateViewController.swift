//
//  TodoCreateViewController.swift
//  simple_todo
//
//  Created by Kotaro Hirayama on 7/24/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import UIKit

class TodoCreateViewController: UIViewController {
    var todoModel:TodoModel!
    weak var delegate:TodoCreateViewControllerDelegate? // weakってなんだったけ
    
    @IBOutlet var todoTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        todoTextField.text = todoModel.title
        todoTextField.delegate = self
        todoTextField.borderStyle = UITextBorderStyle.RoundedRect
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

protocol TodoCreateViewControllerDelegate: class {
    func updateTodoListTitle()
}

extension TodoCreateViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        todoModel.title = textField.text
        delegate?.updateTodoListTitle()
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}