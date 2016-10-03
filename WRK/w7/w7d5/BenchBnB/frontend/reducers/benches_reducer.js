import { RECEIVE_BENCHES } from '../actions/bench_actions';

const BenchesReducer = (state = {}, action = {} ) => {
  switch(action.type){
    case(RECEIVE_BENCHES):
      return action.bench;
    default:
      return state;
  }
};

export default BenchesReducer;
