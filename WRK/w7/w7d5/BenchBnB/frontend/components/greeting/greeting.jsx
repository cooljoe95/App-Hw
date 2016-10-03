import React from 'react';
import { Link } from 'react-router';

export default class Greeting extends React.Component {
  constructor(props){
    super(props);
    this.logout = this.props.logout;
  }
  render(){
    // debugger
    if(this.props.currentUser !== null){
      // debugger
      return (
        <div className="header">
          <h2>Welcome {this.props.currentUser.username}</h2>
          <button onClick={this.logout}>Sign Out</button>
        </div>
      );
    } else {
      return (
        <ul>
          <li><Link to='/signup'>Signup</Link></li>
          <li><Link to='/login'>login</Link></li>
        </ul>
      );
    }
  }

}
