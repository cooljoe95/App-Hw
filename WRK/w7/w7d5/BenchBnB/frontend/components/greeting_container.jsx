import React from 'react';
import SessionAction from '../actions/session_actions';
import Greeting from './greeting';

function mapStateToProps(state){
  return {
    currentUser: state.currentUser
  };
}

function mapDispatchToProps(dispatch){
  return {
    login: (user) => dispatch(SessionAction.login(user)),
    logout: () => dispatch(SessionAction.logout()),
    signup: (user) => dispatch(SessionAction.signup(user))
  };
}



export default connect(mapStateToProps,mapDispatchToProps)(Greeting);
