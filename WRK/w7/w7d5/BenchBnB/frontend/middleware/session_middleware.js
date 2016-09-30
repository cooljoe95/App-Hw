import * as Session from '../actions/session_actions';

export default ({ getState, dispatch }) => next => action => {
  const success = user => dispatch(Session.receiveCurrentUser(user));
  const errors = error => dispatch(Session.receiveErrors(error));

  switch(action.type){

    case(Session.LOGIN):
      login(action.user, success, errors);
      return next(action);

    case(Session.LOGOUT):
      logout(() => next(action));
      break;

    case(Session.SIGNUP):
      signup(action.user, success, errors);
      return next(action);

    default:
      return next(action);
  }
};
