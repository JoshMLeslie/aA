import React from 'react';
import {uniqueID} from '../../util/util.js';
debugger
const listItems = (todos) => {
  return todos.map((item, idx) => {
    return (<li key={idx}>{item.title}</li>);
  });
};

 export default listItems;
