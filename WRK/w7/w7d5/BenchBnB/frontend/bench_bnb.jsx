import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import { Root } from './components/root';
import { login, logout, signup } from './actions/session_actions';
import * as BenchAction from './actions/bench_actions';


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
  window.store = store;
  window.requestBenches = BenchAction.requestBenches;
  window.receiveBenches = BenchAction.receiveBenches;
  ReactDOM.render(
    <Root store={store}/>,
    root
  );
});
