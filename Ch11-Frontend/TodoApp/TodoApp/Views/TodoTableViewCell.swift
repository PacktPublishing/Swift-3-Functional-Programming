//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-26.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    var todo: Todo? {
        didSet {
            updateUI()
        }
    }
    
    var attributedText: NSAttributedString {
        guard let todo = todo else { return NSAttributedString() }
        
        let attributes: [String : AnyObject]
        if todo.completed {
            attributes = [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue as AnyObject]
        } else {
            attributes = [:]
        }
        
        return NSAttributedString(string: todo.name, attributes: attributes)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ todo: Todo) {
        store.producerForTodo(todo).startWithValues {
            nextTodo in
            self.todo = nextTodo
        }
    }
    
    func updateUI() {
        guard let todo = todo else { return }
        
        textLabel?.attributedText = attributedText
        accessoryType = todo.completed ? .checkmark : .none
    }
}
