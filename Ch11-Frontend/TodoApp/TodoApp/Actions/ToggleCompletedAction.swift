import Delta

struct ToggleCompletedAction: ActionType {
    let todo: Todo

    func reduce(state: State) -> State {
        state.todos.value = state.todos.value.map {
            todo in
            guard todo == self.todo else { return todo }
            
            return Todo(id: todo.id,
                      name: todo.name,
               description: todo.description,
                     notes: todo.notes,
                 completed: !todo.completed,
                    synced: !todo.synced,
                  selected: todo.selected)
        }

        return state
    }
}
