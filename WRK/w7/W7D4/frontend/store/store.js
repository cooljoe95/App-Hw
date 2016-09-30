import { createStore, applyMiddleware } from 'redux';
import PokemonReducer from '../reducers/pokemon_reducer';
import { PokemonMiddleware } from '../middleware/pokemon_middleware';


export const configureStore = () => {
  return createStore(
    PokemonReducer,
    applyMiddleware(PokemonMiddleware)
  );
};
