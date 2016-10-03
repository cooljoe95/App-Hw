import React from 'react';
import { Link, Redirect, hashHistory } from 'react-router';

class SessionForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidUpdate() {
    this.redirectIfLoggedIn();
  }

  redirectIfLoggedIn() {
    if(this.props.loggedIn){
      hashHistory.push("/");
    }
  }

  handleSubmit(e) {
    // debugger   
    e.preventDefault();
    const user = this.state;
    this.props.processForm({user});
  }

  render(){

    let errors = <div></div>;
    if(this.props.errors.length !== 0 && typeof(this.props.errors[0]) !== "undefined"){
      errors = (
        <ul>
          {this.props.errors.map((er) => {return <li key={er}>{er.responseText}</li>;})}
        </ul>
      );
    }

    return(
      <div>
        <form onSubmit={this.handleSubmit} hidden={this.props.loggedIn}>
          <h3>{this.props.formType.slice(1)}</h3>
          <p>Would you like to <Link to={this.props.formType === '/login' ? '/signup' : '/login'}>{this.props.formType === '/login' ? 'Sign Up' : "Log In"}</Link> instead?</p>
          <input type="text" name="username" placeholder='username' value={this.state.username}
              onChange={(e) => this.setState({["username"]: e.currentTarget.value})}/>
          <input type="password" name="password" placeholder="password" value={this.state.password}
              onChange={(e) => this.setState({["password"]: e.currentTarget.value})}/>
          <input type="submit"/>
        </form>

        {errors}
        HI
      </div>
    );
  }

}

export default SessionForm;
