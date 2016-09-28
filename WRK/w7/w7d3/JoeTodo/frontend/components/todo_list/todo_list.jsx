import React from 'react';
import { requestTodos } from '../../actions/todo_actions';

export default class TodoList extends React.Component{

  constructor(props){
    super(props);
  }

  componentDidMount(){
    // debugger
    this.props.requestTodos();
    console.log(requestTodos);
  }

  render(){
    const mappedTodos = this.props.todos.map((todo) => {return <li key={todo.id}>{todo.title}</li>;});
    // debugger
    return (
      <ul>
        {mappedTodos}
      </ul>
    );
  }
}
