export const selectAllPokemon = (state) => {
    return Object.values(state.entities.pokemon);
};

export const getItemsByPokemon = (state, pokemon) => {
  return pokemon && pokemon.item_ids ? pokemon.item_ids.map( itemId => state.entities.items[itemId] ) : [];
};
