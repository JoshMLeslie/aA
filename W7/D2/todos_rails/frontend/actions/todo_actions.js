import * as APIUtil from '../util/todo_api_util.js';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';

export const receiveTodos = (todos) => {
  return ({
    type: RECEIVE_TODOS,
    todos
  });
};
export const receiveTodo = (todo) => {
  return ({
    type: RECEIVE_TODO,
    todo
  });
};

export const fetchTodos = () => {
  return ((dispatch) => {
    APIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)) );
  });
};

export const createTodo = (todo) => {
  return ((dispatch) => {
    APIUtil.createTodo(todo).then(todo => dispatch(receiveTodo(todo)) );
  });
};
