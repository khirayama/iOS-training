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
        
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        header.image = UIImage(named: "header")
        
        let title = UILabel(frame: CGRect(x: 10, y: 20, width: 310, height: 44))
        title.text = "TODO LIST"
        header.addSubview(title)
        
        self.view.addSubview(header)
    }
}