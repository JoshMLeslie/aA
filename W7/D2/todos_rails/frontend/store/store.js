import { createStore, applyMiddleware } from 'redux';
import { thunk } from '../middleware/thunk.js';
import rootReducer from '../reducers/root_reducer.js';

const configureStore = () => createStore(rootReducer, applyMiddleware(thunk));

export default configureStore;
