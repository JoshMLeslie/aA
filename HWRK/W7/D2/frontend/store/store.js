import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunk from 'redux-thunk';
import logger from 'redux-logger';

const configureStore = (preloadedState = {}) => {
  const store = createStore (
    rootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch)
   );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
    console.log("start: " + action.todo.id);
    console.log(store.getState());
    console.log(action);
    next(action);
    console.log(store.getState());
    console.log("end: " + action.todo.id);
};

// const applyMiddlewares = (store, ...midwares) => {
//   let dispatch = store.dispatch;
//   midwares.forEach ((ware) => {
//     dispatch = ware(store)(dispatch);
//   });
//
//   return Object.assign({},store, { dispatch });
// };


export default configureStore;
