import pokemon from './pokemon_reducer';
import items from './items_reducer';

import { combineReducers } from 'redux';

export default combineReducers({ pokemon, items });
