import Delta

struct ClearCompletedTodosAction: DynamicActionType {
    func call() {
        let todos = store.completedTodos.first()?.value ?? []
        
        todos.forEach {
            todo in
            store.dispatch(DeleteTodoAction(todo: todo))
        }
    }
}
