import React from 'react';
import PokemonItems from './pokemon_item';
import PokemonDetail from './pokemon_detail_container';
import { Switch, Route } from 'react-router-dom';

export default class PokemonIndex extends React.Component {
  constructor (props) {
    super(props);
  }

  componentDidMount () {
    this.props.requestAllPokemon();
  }

  render () {
    return (
      <main>
        <Route path='/pokemon/:pokemonId' component={PokemonDetail} />
        <ul>
          <PokemonItems pokemon={this.props.pokemon} />
        </ul>
      </main>
    );
  }
}
