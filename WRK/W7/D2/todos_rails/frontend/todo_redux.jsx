  import React from 'react';
  import ReactDOM from 'react-dom';
  import configureStore from './store/store.js';
  import Root from './components/root';
  import { receiveTodo, receiveTodos } from './actions/todo_actions.js';
  import selector from './reducers/selectors.js';
  import connectFn from './components/todos/todo_list_container.jsx';
  import { fetchTodos } from './actions/todo_actions.js';
  import { thunk } from './middleware/thunk.js';


  const store = configureStore();

  document.addEventListener('DOMContentLoaded', () => {
    const rootElement = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, rootElement);
  });

window.receiveTodo = receiveTodo;
// store.dispatch(receiveTodo({ id: 3, title: 'New Todo' }));
window.receiveTodos = receiveTodos;

window.connectFn = connectFn;


window.store = store;
window.thunk = thunk;
window.selector = selector;
window.fetchTodos = fetchTodos;
