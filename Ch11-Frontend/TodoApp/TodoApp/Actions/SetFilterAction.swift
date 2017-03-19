import Delta

struct SetFilterAction: ActionType {
    let filter: TodoFilter
    
    func reduce(state: State) -> State {
        state.filter.value = filter
        return state
    }
}
