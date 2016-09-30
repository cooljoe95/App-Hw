import { Router, Route, hashHistory} from 'react-router';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import React from 'react';
import { requestAllPokemon } from '../actions/pokemon_actions'


const onEnterCallback = ({dispatch}) => {
  dispatch(requestAllPokemon());
}



export const Root = ({store}) => {

  const returnVal = (
    <Provider store={store}>
      <Router history={hashHistory}>
        <Route path="/" component={PokemonIndexContainer} onEnter={onEnterCallback.bind(this, store)}>
          <Route path="pokemon/:id" />
        </Route>
      </Router>
    </Provider>
  );
  // debugger
  return returnVal;
};
