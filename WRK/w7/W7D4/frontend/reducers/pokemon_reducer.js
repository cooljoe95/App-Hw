import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_SINGLE_POKEMON
} from '../actions/pokemon_actions';

import merge from 'lodash/merge';

export default (state = {pokemon: [], detailPokemon: []}, action) => {
  let newState;
  switch(action.type) {
    case (RECEIVE_ALL_POKEMON):
      newState = merge({}, state, { pokemon: action.pokemon });
      return newState;
    case (RECEIVE_SINGLE_POKEMON):
      newState = merge({}, state);
      newState[detailPokemon] = [action.pokemon];
      return newState;
    default:
      return state;
  }
};
