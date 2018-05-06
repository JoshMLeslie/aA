import { connect } from 'react-redux';
import { getItemsByPokemon } from '../../reducers/selectors';
import ItemDetail from './item_detail';

const mapStateToProps = (state, ownProps) => {
  debugger
  let itemId = ownProps.match.params.id;
  let item = state.entities.items[itemId];
  return (
    {item}
  );
};

const mapDispatchToProps = dispatch => {
  return (
    {requestAllPokemon: () => dispatch(requestAllPokemon())}
  );
};


export default connect(mapStateToProps, mapDispatchToProps)(ItemDetail);
