import { applyMiddleware } from 'redux';
import TodoMiddleware from './todo_middleware';


const MasterMiddleware =
  applyMiddleware(TodoMiddleware);


export default MasterMiddleware;
