import merge from 'lodash/merge';
import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions';

export default (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({},state,action.pokemon);
    default:
      return state;
  }
};
