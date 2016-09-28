import { createStore } from 'redux';
import reducer from '../reducers/index';
// debugger

export const configureStore = () => {
  return createStore(reducer);
};
