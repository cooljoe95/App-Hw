import { createStore, applyMiddleware } from 'redux';
import reducer from '../reducers';

const addLoggingToDispatch = ({ getState }) => (next) => (action) => {
  console.log("old state: " + getState());
  console.log("action: " + action);
  const returnVal = next(action);
  console.log("new state: " + getState());
  return returnVal;
};

const configureStore = (preloadedState = {}) => (
  createStore(
    reducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch)
  )
);

export default configureStore;
