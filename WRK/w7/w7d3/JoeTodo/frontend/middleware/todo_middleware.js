import { REQUEST_TODOS, RECEIVE_TODOS } from '../actions/todo_actions';
import { fetchTodos } from '../util/todo_api_util';
import { receiveTodos } from '../actions/todo_actions';

const middleware = ({ getState, dispatch }) => next => action => {
  switch(action.type){
    case(REQUEST_TODOS):
      const success = data => dispatch(receiveTodos(data));
      const failure = e => console.log(e);
      fetchTodos(success, failure);
      break;
    default:
      next(action);
  }
};

export default middleware;
