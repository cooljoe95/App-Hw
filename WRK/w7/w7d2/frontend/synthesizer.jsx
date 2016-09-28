import Note from './util/note';
import { configureStore } from './store/store';
import Root from './components/root';
import ReactDOM from 'react-dom';
import React from 'react';


document.addEventListener("DOMContentLoaded", () => {
  const store = new configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store } />, root);
  console.log(store.getState());
});


window.Note = Note;
