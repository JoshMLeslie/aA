//presentational => html stuff
import React from 'react';
import { TodoForm } from '../todo_list/todo_form.jsx';
import { uniqueID } from '../../util/util';

class ToDoList extends React.Component {

componentDidMount () {
  this.props.fetchTodos();
}


  listItems () {
    return todos.map((item, idx) => {
      return (<li key={item.id}>{item.title}</li>);
    });
  }

  render () {
    const {todos, createTodo} = this.props;
    return (
      <div>
        <h3>Todo List!</h3>
        <TodoForm createTodo = { createTodo } />
        <ul>
          {this.listItems()}
        </ul>
      </div>
    );
  }
}


export default ToDoList;
