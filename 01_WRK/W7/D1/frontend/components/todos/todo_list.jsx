//presentational => html stuff
import React from 'react';
import Items from './todo_list_item.jsx';

const ToDoList = (props) => {
    // const someTodos = ["fred","bob"];
// debugger
  return (
    <div>
      <h3>Todo List!</h3>
      <ul>
      {Items(props.todos)}
      </ul>
    </div>
  );
};

export default ToDoList;
