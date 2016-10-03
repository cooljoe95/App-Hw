import React from 'react';
import { Provider } from 'react-redux';
import { Router, Redirect, Route, IndexRoute, hashHistory } from 'react-router';
import { App } from './app';
import SessionFormContainer from './session/session_form_container';

const redirect_if_logged_in = function(store){
  if(store.getState().session.currentUser){

  } else {
    <Redirect to="/#/" />;
  }
};

export const Root = ({ store }) => (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
        <Route path="/login" component={SessionFormContainer} onEnter={redirect_if_logged_in(store)}/>
        <Route path="/signup" component={SessionFormContainer} onEnter={redirect_if_logged_in(store)}/>
      </Route>
    </Router>
  </Provider>
);
