import Delta

struct DeleteTodoAction: ActionType {
    let todo: Todo
    
    func reduce(state: State) -> State {
        state.todos.value = state.todos.value.filter { $0 != self.todo }
        
        return state
    }
}
