//
//  TodoModel.swift
//  simple_todo
//
//  Created by Kotaro Hirayama on 7/24/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import UIKit

class TodoModel {
    
    var title:String = ""
    var completed:Bool = false
    
    init(title:String, completed:Bool) {
        self.title = title
        self.completed = completed
    }
}
