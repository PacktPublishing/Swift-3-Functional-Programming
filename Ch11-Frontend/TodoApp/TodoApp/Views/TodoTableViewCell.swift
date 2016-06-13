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
            attributes = [NSStrikethroughStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        } else {
            attributes = [:]
        }
        
        return NSAttributedString(string: todo.name, attributes: attributes)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(todo: Todo) {
        store.producerForTodo(todo).startWithNext { nextTodo in
            self.todo = nextTodo
        }
    }
    
    func updateUI() {
        guard let todo = todo else { return }
        
        textLabel?.attributedText = attributedText
        accessoryType = todo.completed ? .Checkmark : .None
    }

}
