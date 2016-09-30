import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import * as SessionAction from './actions/session_actions';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  window.SessionAction = SessionAction;
  window.store = configureStore();
  ReactDOM.render(
    <h1>Welcome to BenchBnB</h1>,
    root
  );
});
