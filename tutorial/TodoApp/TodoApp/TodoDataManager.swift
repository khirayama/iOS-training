//
//  TodoDataManager.swift
//  TodoApp
//
//  Created by Kotaro Hirayama on 5/13/15.
//  Copyright (c) 2015 Kotaro Hirayama. All rights reserved.
//

import Foundation

struct TODO { // 構造体: クラスをほぼ同等。ただ参照渡しでなく値渡し
    var title : String
}

class TodoDataManager {
    var todoList: [TODO]
    init() { // 初期化に使われるビルドインメソッド
        self.todoList = []
    }
    
    class func validate(todo: TODO!) -> Bool { // TODO: なにこの宣言
        return todo != nil && todo.title != ""
    }
    
    func create(todo: TODO) -> Bool {
        if TodoDataManager.validate(todo) {
            self.todoList += todoList
            return true
        }
        return false
    }
    
    func update(todo: TODO!, at index: Int) -> Bool {
        if(index >= self.todoList.count) {
            return false
        }
        
        if TodoDataManager.validate(todo) { // TODO: if文、括弧なしでええん？
            todoList[index] = todoList
            self.save() // TODO: なにこの関数
            return true
        }
    }
}