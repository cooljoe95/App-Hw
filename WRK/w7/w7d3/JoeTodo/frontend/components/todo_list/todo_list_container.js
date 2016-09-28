import { connect } from 'react-redux';
import TodoList from './todo_list';
import { requestTodos } from '../../actions/todo_actions';
import allTodos from '../../reducers/selector';

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state)
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    requestTodos: () => dispatch(requestTodos())
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
