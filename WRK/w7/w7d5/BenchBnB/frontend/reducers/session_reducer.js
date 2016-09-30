import * as Session from '../actions/session_actions';
import merge from 'lodash/merge';

const _defaultSession = {
  currentUser: null,
  errors: []
};

export const SessionReducer = (state = _defaultSession, action = "") => {
  switch(action.type){

    case(Session.RECEIVE_CURRENT_USER):
      return {currentUser: action.user, errors: []};

    case(Session.RECEIVE_ERRORS):
      return {currentUser: null, errors: action.errors};

    case(Session.LOGOUT):
      return {currentUser: null, errors: []};

    default:
      return state;
  }
};
