import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import { Root } from './components/root';
import { login, logout, signup } from './actions/session_actions';


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  window.SAlogin = login;
  window.SAlogout = logout;
  window.SAsignup = signup;
  window.store = store;
  ReactDOM.render(
    <Root store={store}/>,
    root
  );
});
