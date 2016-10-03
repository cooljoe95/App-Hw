import { REQUEST_BENCHES, RECEIVE_BENCHES, receiveBenches } from '../actions/bench_actions.js';
import { fetchBenches } from '../util/bench_api_util.js';

const BenchesMiddleware = ({ getState, dispatch }) => next => action => {
  switch(action.type){
    case(REQUEST_BENCHES):
      const success = data => dispatch(receiveBenches(data));
      fetchBenches(success);
      return next(action);
    default:
      next(action);
  }
};

export default BenchesMiddleware;
