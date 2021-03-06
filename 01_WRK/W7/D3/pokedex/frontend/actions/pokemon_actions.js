import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const REQUEST_ALL_POKEMON = "REQUEST_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";
export const REQUEST_POKEMON = "REQUEST_POKEMON";

export const receiveAllPokemon = pokemon => {
  return ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
  });
};

export const requestAllPokemon = () => {
  return (dispatch) =>
  APIUtil.fetchAllPokemon()
  .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const receivePokemon = (payload) => {
  return {
    type: RECEIVE_POKEMON,
    payload // {items + pokemon}
  };
};

export const requestPokemon = (id) => {

  return (dispatch) => {

    return (
      APIUtil.fetchPokemon(id)
      .then(pokemon => dispatch(receivePokemon(pokemon)))
    );
  };
};
