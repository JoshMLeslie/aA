import React from 'react';
import Pokemon from './pokemon_item';

export default class PokemonIndex extends React.Component {
  constructor (props) {
    super(props);
  }

  componentDidMount () {
    this.props.requestAllPokemon();
  }

  render () {
    return (
      <ul>
        <Pokemon pokemon={this.props.pokemon} />
      </ul>
    );
  }
}
