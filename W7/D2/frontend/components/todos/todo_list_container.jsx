// functional => other. stuff.
import React from 'react';
import {connect} from 'react-redux';
import ToDoList from './todo_list.jsx';
import { receiveTodos, receiveTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';


const mapStateToProps = (state) => {
  return (
    { todos: allTodos(state) }
  );
};

const mapDispatchToProps = dispatch => {
  return (
    { receiveTodo: (todo) => dispatch(receiveTodo(todo)) }
  );
};

export default connect( mapStateToProps, mapDispatchToProps )(ToDoList);
