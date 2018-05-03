import React from 'react';
import ReactDOM from 'react-dom';
import createStore from './store/store';
import {requestAllPokemon} from './actions/pokemon_actions';
import {fetchAllPokemon} from './util/api_util';
import {selectAllPokemon} from './reducers/selectors';
import { Root } from './components/root';


window.requestAllPokemon = requestAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.selectAllPokemon = selectAllPokemon;

document.addEventListener('DOMContentLoaded', () => {
  const store = createStore();
  const rootEl = document.getElementById('root');
  // confirmed store / getState / dispatch on window @ 05.02 -- 3:23 pm
  // window.store = store;
  // window.getState = store.getState;
  // window.dispatch = store.dispatch;

  ReactDOM.render(<Root store={store} />, rootEl);
});
