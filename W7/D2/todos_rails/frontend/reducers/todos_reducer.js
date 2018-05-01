import { merge } from 'lodash';
import { RECEIVE_TODO, RECEIVE_TODOS } from '../actions/todo_actions';

 const todosReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      return action.todos;
    case RECEIVE_TODO:
      const newTodo = {[action.todo.id]: action.todo};
      return ( merge({},state,newTodo) );
    default:
      return state;
  }
};

export default todosReducer;
