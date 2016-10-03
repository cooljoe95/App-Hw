import { connect } from 'react-redux';
import { login, signup } from '../../actions/session_actions';
import SessionForm from './session_form';

function mapStateToProps(state){
  
  return {
    loggedIn: state.session.currentUser ? true : false,
    errors: [].concat(state.session.errors)
  };
}

function mapDispatchToProps(dispatch, ownProps){
  // debugger
  return {
    formType: ownProps.location.pathname,
    processForm: (user) => ownProps.location.pathname === '/login' ? dispatch(login(user)) : dispatch(signup(user))
  };
}



export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
