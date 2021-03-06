import { combineReducers } from 'redux';
import errors from './error_reducer';
import session from './session_reducer';
import entities from './entities_reducer';

export default combineReducers({
  errors,
  session,
  entities
});
