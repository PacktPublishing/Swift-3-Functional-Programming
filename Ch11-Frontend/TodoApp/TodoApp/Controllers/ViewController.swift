//
//  ViewController.swift
//  TodoApp
//
//  Created by Fatih Nayebi on 2016-04-24.
//  Copyright © 2016 Fatih Nayebi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    
    var viewModel = TodosViewModel(todos: []) {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTodos() { (response, error) in
            if error == nil {
                store.dispatch(LoadTodosAction(todos: response!))
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
        filterSegmentedControl.addTarget(self, action: #selector(ViewController.filterValueChanged), forControlEvents: .ValueChanged)
        
        store.activeFilter.producer.startWithNext { filter in
            self.filterSegmentedControl.selectedSegmentIndex = filter.rawValue
        }
        
        store.activeTodos.startWithNext { todos in
            self.viewModel = TodosViewModel(todos: todos)
        }
        
        store.notSyncedWithBackend.startWithNext { todos in
            addOrUpdateTodo(todos) { (response, error) in
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
extension ViewController {
    @IBAction func addTapped(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Create", message: "Create a new todo item", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler() { textField in
            textField.placeholder = "Id"
        }
        alertController.addTextFieldWithConfigurationHandler() { textField in
            textField.placeholder = "Name"
        }
        alertController.addTextFieldWithConfigurationHandler() { textField in
            textField.placeholder = "Description"
        }
        alertController.addTextFieldWithConfigurationHandler() { textField in
            textField.placeholder = "Notes"
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel) { _ in })
        alertController.addAction(UIAlertAction(title: "Create", style: .Default) { _ in
            guard let id = alertController.textFields?[0].text,
                name = alertController.textFields?[1].text,
                description = alertController.textFields?[2].text,
                notes = alertController.textFields?[3].text
                else { return }
            
            store.dispatch(CreateTodoAction(id: Int(id)!, name: name, description: description, notes: notes))
            })
        presentViewController(alertController, animated: false, completion: nil)
    }
    
    func filterValueChanged() {
        guard let newFilter = TodoFilter(rawValue: filterSegmentedControl.selectedSegmentIndex)
            else { return }
        
        store.dispatch(SetFilterAction(filter: newFilter))
    }
}

// MARK: UITableViewController
extension ViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath) as! TodoTableViewCell
        let todo = viewModel.todoForIndexPath(indexPath)
        
        cell.configure(todo)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let todo = viewModel.todoForIndexPath(indexPath)
        store.dispatch(ToggleCompletedAction(todo: todo))
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            let todo = self.viewModel.todoForIndexPath(indexPath)
            store.dispatch(DeleteTodoAction(todo: todo))
        }
        delete.backgroundColor = UIColor.redColor()
        
        let details = UITableViewRowAction(style: .Normal, title: "Details") { action, index in
            let todo = self.viewModel.todoForIndexPath(indexPath)
            store.dispatch(DetailsTodoAction(todo: todo))
            
            self.performSegueWithIdentifier("segueShowDetails", sender: self)
        }
        details.backgroundColor = UIColor.orangeColor()
        
        return [details, delete]
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
}





