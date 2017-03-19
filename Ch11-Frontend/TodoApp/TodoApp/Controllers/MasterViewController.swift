//
//  MasterViewController.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-24.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    
    var viewModel = TodosViewModel(todos: []) {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTodos() {
            (response, error) in
            if error == nil {
                store.dispatch(LoadTodosAction(todos: response!))
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
        filterSegmentedControl.addTarget(self, action: #selector(MasterViewController.filterValueChanged), for: .valueChanged)
        
        store.activeFilter.producer.startWithValues {
            filter in
            self.filterSegmentedControl.selectedSegmentIndex = filter.rawValue
        }
        
        store.activeTodos.startWithValues {
            todos in
            self.viewModel = TodosViewModel(todos: todos)
        }
        
        store.notSyncedWithBackend.startWithValues {
            todos in
            addOrUpdateTodo(todos) {
                (response, error) in
                if error == nil {
                    print("Success")
                } else {
                    print("Error: \(error?.localizedDescription)")
                }
            }
        }
    }
}

// MARK: Actions
extension MasterViewController {
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Create",
                                                message: "Create a new todo item",
                                                preferredStyle: .alert)
        
        alertController.addTextField() {
            textField in
            textField.placeholder = "Id"
        }
        
        alertController.addTextField() {
            textField in
            textField.placeholder = "Name"
        }
        
        alertController.addTextField() {
            textField in
            textField.placeholder = "Description"
        }
        
        alertController.addTextField() {
            textField in
            textField.placeholder = "Notes"
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        
        alertController.addAction(UIAlertAction(title: "Create", style: .default) { _ in
            guard let id = alertController.textFields?[0].text,
                let name = alertController.textFields?[1].text,
                let description = alertController.textFields?[2].text,
                let notes = alertController.textFields?[3].text
                else { return }
            
            store.dispatch(CreateTodoAction(todoId: Int(id)!,
                                            name: name,
                                            description: description,
                                            notes: notes))
        })
        present(alertController, animated: false, completion: nil)
    }
    
    func filterValueChanged() {
        guard let newFilter = TodoFilter(rawValue: filterSegmentedControl.selectedSegmentIndex)
            else { return }
        
        store.dispatch(SetFilterAction(filter: newFilter))
    }
}

// MARK: UITableViewController
extension MasterViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        let todo = viewModel.todoForIndexPath(indexPath)
        
        cell.configure(todo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = viewModel.todoForIndexPath(indexPath)
        store.dispatch(ToggleCompletedAction(todo: todo))
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            let todo = self.viewModel.todoForIndexPath(indexPath)
            store.dispatch(DeleteTodoAction(todo: todo))
        }
        delete.backgroundColor = UIColor.red
        
        let details = UITableViewRowAction(style: .normal, title: "Details") { action, index in
            let todo = self.viewModel.todoForIndexPath(indexPath)
            store.dispatch(DetailsTodoAction(todo: todo))
            
            self.performSegue(withIdentifier: "segueShowDetails", sender: self)
        }
        details.backgroundColor = UIColor.orange
        
        return [details, delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // the cells you would like the actions to appear need to be editable
        return true
    }
}

