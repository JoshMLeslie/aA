import React from 'react';
import { Link } from 'react-router-dom';

export default (props) => {
  return (
    props.pokemon.map(pokemon => {
      return (
        <li key={pokemon.id}>
          <Link to={`/pokemon/${pokemon.id}`}>
            {pokemon.name}<br />
            <img src={pokemon.image_url}></img>
          </Link>
       </li>
      );
  })

  );
};
