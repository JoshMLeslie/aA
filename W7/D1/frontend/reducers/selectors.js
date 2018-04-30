export const allTodos = state => {
  const keys = Object.keys(state.todos);
  // keys === 'id's
  return keys.map((id) => state.todos[id]
  );
};
