const allTodos = (state) => {
  const keys = Object.keys(state.todos);
  return keys.map((key) => {return state.todos[key];});
};

export default allTodos;
