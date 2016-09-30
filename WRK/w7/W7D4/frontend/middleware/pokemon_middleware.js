import {
  receiveAllPokemon,
  REQUEST_ALL_POKEMON,
  REQUEST_SINGLE_POKEMON,
  receiveSinglePokemon
} from "../actions/pokemon_actions";

import {
  fetchAllPokemon,
  fetchSinglePokemon
} from '../util/api_util';

export const PokemonMiddleware = ({ dispatch }) => next => action => {
  // debugger
  let success, error;
   switch(action.type) {
    case (REQUEST_ALL_POKEMON):
      success = (data) => {dispatch(receiveAllPokemon(data))};
      error = e => console.log(e);
      return fetchAllPokemon(success, error);
    case (REQUEST_SINGLE_POKEMON):
      success = (data) => {dispatch(receiveSinglePokemon(data))};
      error = e => console.log(e);
      return fetchSinglePokemon(action.pokemon, success, error);
     default:
      return next(action);
   }
};
