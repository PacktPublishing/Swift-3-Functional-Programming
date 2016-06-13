//
//  DetailsViewController.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-29.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import UIKit
import ReactiveCocoa

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var txtFieldDescription: UITextField!
    @IBOutlet weak var txtFieldNotes: UITextField!
    @IBOutlet weak var switchCompleted: UISwitch!
    
    var viewModel = TodoViewModel(todo: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.selectedTodo.startWithNext { todos in
            let model = todos.first!
            self.txtFieldName.text = model.name
            self.txtFieldDescription.text = model.description
            self.txtFieldNotes.text = model.notes
            self.switchCompleted.on = model.completed
            self.viewModel = TodoViewModel(todo: model)
        }
        setupUpdateSignals()
    }
    
    func setupUpdateSignals()  {
        txtFieldName.rac_textSignal().subscribeNext {
            (next: AnyObject!) -> () in
            if let newName = next as? String {
                let newTodo = todoNameLens.set(newName, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))
            }
        }
        txtFieldDescription.rac_textSignal().subscribeNext {
            (next: AnyObject!) -> () in
            if let newDescription = next as? String {
                let newTodo = todoDescriptionLens.set(newDescription, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))
            }
        }
        txtFieldNotes.rac_textSignal().subscribeNext {
            (next: AnyObject!) -> () in
            if let newNotes = next as? String {
                let newTodo = todoNotesLens.set(newNotes, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))

            }
        }
        switchCompleted.rac_newOnChannel().subscribeNext {
            (next: AnyObject!) -> () in
            if let newCompleted = next as? Bool {
                let newTodo = todoCompletedLens.set(newCompleted, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))

            }
        }
    }
    
}
