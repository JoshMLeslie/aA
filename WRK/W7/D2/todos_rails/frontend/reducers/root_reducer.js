import { combineReducers } from 'redux';
import todos from './todos_reducer.js';

export default combineReducers({todos});

// const rootReducer =  (state, action) => {
//   return ({
//     todos: todosReducer(state, action)
//   });
// };

// export default rootReducer;
