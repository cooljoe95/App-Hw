import { applyMiddleware } from 'redux';
import SessionMiddleware from './session_middleware';
import BenchesMiddleware from './benches_middleware';

const RootMiddleware = applyMiddleware(
  SessionMiddleware,
  BenchesMiddleware
);

export default RootMiddleware;
