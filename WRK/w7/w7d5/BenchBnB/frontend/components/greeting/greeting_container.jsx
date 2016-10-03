import { connect } from 'react-redux';
import { logout } from '../../actions/session_actions';
import Greeting from './greeting';

function mapStateToProps(state){
  return {
    currentUser: state.session.currentUser
  };
}

function mapDispatchToProps(dispatch){
  return {
    logout: () => dispatch(logout()),
  };
}



export default connect(mapStateToProps, mapDispatchToProps)(Greeting);
