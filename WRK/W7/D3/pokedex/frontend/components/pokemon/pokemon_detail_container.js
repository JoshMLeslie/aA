import { connect } from 'react-redux';
import { getItemsByPokemon } from '../../reducers/selectors';
import { requestPokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = (state, ownProps) => {
  let id = ownProps.match.params.pokemonId;
  let pokemon = state.entities.pokemon[id];
  let items = getItemsByPokemon(state, pokemon);
  return (
    {
      items,
      pokemon,
    }
  );
};

const mapDispatchToProps = dispatch => {
  return (
    {requestPokemon: (id) => dispatch(requestPokemon(id))}
  );
};


export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
