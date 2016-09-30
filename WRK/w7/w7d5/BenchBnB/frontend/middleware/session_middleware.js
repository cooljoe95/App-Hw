import * as SessionAction from '../actions/session_actions';
import { login, signup, logout } from '../util/session_api_util';

export default ({ getState, dispatch }) => next => action => {
  const success = user => dispatch(SessionAction.receiveCurrentUser(user));
  const errors = error => dispatch(SessionAction.receiveErrors(error));

  switch(action.type){
    case(SessionAction.LOGIN):
      login(action.user, success, errors);
      return next(action);

    case(SessionAction.LOGOUT):
      logout(() => next(action));
      break;

    case(SessionAction.SIGNUP):
      signup(action.user, success, errors);
      return next(action);

    default:
      return next(action);
  }
};
