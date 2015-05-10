//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Kotaro Hirayama on 4/11/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import UIKit

class TodoTableViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = UILabel(frame: CGRect(x: 10, y: 20, width: 310, height: 44))
        title.text = "TODO LIST"
        self.view.addSubview(title)
        
    }
}