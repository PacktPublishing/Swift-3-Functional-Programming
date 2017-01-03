//
//  DetailsViewController.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-29.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var txtFieldDescription: UITextField!
    @IBOutlet weak var txtFieldNotes: UITextField!
    @IBOutlet weak var switchCompleted: UISwitch!
    
    var viewModel = TodoViewModel(todo: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.selectedTodo.startWithValues { todos in
            let model = todos.first!
            self.txtFieldName.text = model.name
            self.txtFieldDescription.text = model.description
            self.txtFieldNotes.text = model.notes
            self.switchCompleted.isOn = model.completed
            self.viewModel = TodoViewModel(todo: model)
        }
        setupUpdateSignals()
    }
    
    func setupUpdateSignals()  {
        txtFieldName.reactive.continuousTextValues.observeValues {
            (values: String?) -> () in
            if let newName = values {
                let newTodo = todoNameLens.set(newName, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))
            }
        }
        
        txtFieldDescription.reactive.continuousTextValues.observeValues {
            (values: String?) -> () in
            if let newDescription = values {
                let newTodo = todoDescriptionLens.set(newDescription, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))
            }
        }
        
        txtFieldNotes.reactive.continuousTextValues.observeValues {
            (values: String?) -> () in
            if let newNotes = values {
                let newTodo = todoNotesLens.set(newNotes, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))
                
            }
        }
        switchCompleted.reactive.isOnValues.observeValues {
            (value: Bool) -> () in
            let newTodo = todoCompletedLens.set(value, self.viewModel.todo!)
            store.dispatch(UpdateTodoAction(todo: newTodo))
        }
    }
}
