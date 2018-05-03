import React from 'react';
import { Route } from 'react-router-dom';
import ItemDetail from '../items/item_detail_container';

export default class PokemonDetail extends React.Component {
  componentDidMount() { // 2 init -- no normal
    let id = this.props.match.params.pokemonId;
    this.props.requestPokemon(id);
  }

  componentWillReceiveProps(newProps) { // 3 init -- 1, 3 normal
    let oldId = this.props.match.params.pokemonId;
    let newId = newProps.match.params.pokemonId;
    if (oldId !== newId) {
      this.props.requestPokemon(newId);
    }
  }

  render () { // 1, 4 init -- 2, 4 normal
    let poke = this.props.pokemon;
    if (!poke) return null;
debugger
// works when visited directly (pokemon/:id) but not from another page. ???
    let items = poke.item_ids.map((item_id) => {
      debugger
      return (<li><ItemDetail id={item_id}/></li>);
    });

    return (
      <div>
        <h1> {poke.name} </h1>
        <img src={poke.image_url}></img>
        <br />
        <ul>

        </ul>
    </div>
);
  }
}
