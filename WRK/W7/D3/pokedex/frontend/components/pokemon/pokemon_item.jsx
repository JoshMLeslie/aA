import React from 'react';

export default (props) => {
  return (
    props.pokemon.map(pokemon => <li> {pokemon.name} <img src={pokemon.image_url}></img> </li>)
  );
};
