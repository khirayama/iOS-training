//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Kotaro Hirayama on 4/1/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MyLabel: UILabel!
    
    @IBAction func changeLabel(sender: AnyObject) {
        MyLabel.text = "Hello World"
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

