import merge from 'lodash/merge';
import {RECEIVE_ALL_POKEMON, RECEIVE_POKEMON} from '../actions/pokemon_actions';


export default (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({},state,action.pokemon);
    case RECEIVE_POKEMON:
      let id = action.payload.pokemon.id;
      return merge({}, state, {[id]: action.payload.pokemon});
    default:
      return state;
  }
};
