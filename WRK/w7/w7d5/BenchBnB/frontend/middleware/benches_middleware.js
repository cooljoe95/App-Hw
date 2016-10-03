import { REQUEST_BENCHES, RECEIVE_BENCHES } from '../actions/bench_actions.js';

const BenchesMiddleware = ({ getState, dispatch }) => next => action => {
  switch(action.type){
    case(REQUEST_BENCHES):
      console.log("will request Benches");
      return next(action);
    default:
      next(action);
  }
};

export default BenchesMiddleware;
