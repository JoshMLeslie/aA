import merge from 'lodash/merge';
import { RECEIVE_POKEMON} from '../actions/pokemon_actions';

export default (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_POKEMON:
      let items = action.payload.items;
      return merge({}, state, items);
    default:
      return state;
  }
};
