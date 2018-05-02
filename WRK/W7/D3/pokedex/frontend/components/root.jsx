import React from 'react';
import { Provider } from 'react-redux';
import Pokedex from './pokemon/pokemon_index_container';

export const Root = ({ store }) => (
    <Provider store={store}>
      <Pokedex />
    </Provider>
);
