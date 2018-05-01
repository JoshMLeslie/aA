// functional => other. stuff. and more stuff.
import React from 'react';
import {connect} from 'react-redux';
import ToDoList from './todo_list.jsx';
import { fetchTodos, createTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

const mapStateToProps = (state) => {
  return (
    { todos: allTodos(state) }
  );
};

const mapDispatchToProps = dispatch => {
  return ({
    fetchTodos: () => dispatch(fetchTodos()),
    createTodo: (todo) => dispatch(createTodo(todo))
  });
};

export default connect( mapStateToProps, mapDispatchToProps )(ToDoList);
