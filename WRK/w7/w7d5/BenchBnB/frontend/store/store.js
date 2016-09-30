import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';

export default (preloadedState = {}) => {
  return createStore(
    RootReducer,
    preloadedState
  );
};
