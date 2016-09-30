import React from "react";
import ReactDOM from "react-dom";
import { login, logout, signup } from './util/session_api_util';
import configureStore from './store/store';
import * as Session from './reducers/session_reducer';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  window.login = login;
  window.logout = logout;
  window.signup = signup;
  window.store = configureStore();
  ReactDOM.render(
    <h1>Welcome to BenchBnB</h1>,
    root
  );
});
