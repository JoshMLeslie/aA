import React from 'react';
import { Provider } from 'react-redux';
import Pokedex from './pokemon/pokemon_index_container';
import { HashRouter, Route } from 'react-router-dom';

export const Root = ({ store }) => (
    <Provider store={store}>
      <HashRouter >
        <div>
          <Route path='/potato' render={() => <h1>POTATOES</h1>} />
          <Route path='/' component={Pokedex} />
        </div>
      </HashRouter>
    </Provider>
);
