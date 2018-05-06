import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
// import thunk from 'redux-thunk';
import rootReducer from '../reducers/root_reducer';
import {thunk} from '../middleware/thunk';

export default () => {
  return createStore(rootReducer, applyMiddleware(thunk, logger));
};
