import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import RootMiddleware from '../middleware/root_middleware';

export default (preloadedState = {}) => {
  return createStore(
    RootReducer,
    preloadedState,
    RootMiddleware
  );
};
