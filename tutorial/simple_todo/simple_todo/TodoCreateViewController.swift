//
//  TodoCreateViewController.swift
//  simple_todo
//
//  Created by Kotaro Hirayama on 7/24/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import UIKit

class TodoCreateViewController: UIViewController {
    var todoModel:String!
    
    @IBOutlet var myTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        myTextField.text = todoModel
        myTextField.delegate = self
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:100);
        self.view.addSubview(myTextField)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TodoCreateViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField){
        println(textField.text)
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println(textField.text)
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}