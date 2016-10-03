import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import { Root } from './components/root';
import { login, logout, signup } from './actions/session_actions';


document.addEventListener("DOMContentLoaded", () => {
  let store;
  if(window.currentUser){
    const preloadedState = {
      session: {
        currentUser: window.currentUser
      }
    };
    store = configureStore(preloadedState);
  } else {
    store = configureStore();
  }
  const root = document.getElementById("root");
  window.SAlogin = login;
  window.SAlogout = logout;
  window.SAsignup = signup;
  window.store = store;
  ReactDOM.render(
    <Root store={store}/>,
    root
  );
});
