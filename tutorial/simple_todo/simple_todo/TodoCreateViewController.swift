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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabel.text = todoModel
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet var todoLabel: UILabel!
}
