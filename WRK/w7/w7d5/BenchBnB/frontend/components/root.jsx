import React from 'react';
import { Provider } from 'react-redux';
import { Router, Redirect, Route, IndexRoute, hashHistory, withRouter } from 'react-router';
import { App } from './app';
import SessionFormContainer from './session/session_form_container';


export const Root = ({ store }) => {
  const _redirectIfLoggedIn = (nextState, replace) => {
    // debugger
    if(store.getState().session.currentUser){
      replace('/');
    }
  };
  return (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
        <Route path="/login" component={SessionFormContainer} onEnter={_redirectIfLoggedIn}/>
        <Route path="/signup" component={SessionFormContainer} onEnter={_redirectIfLoggedIn}/>
      </Route>
    </Router>
  </Provider>
)};
