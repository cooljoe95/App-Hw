import React from 'react';
import ReactDOM from 'react-dom';
// import PokemonIndexContainer from './components/pokemon/pokemon_index_container';
import { configureStore } from './store/store';
import { Root } from "./components/root";
// import { Provider } from 'react-redux';
// import { Router, Route, hashHistory } from 'react-router';

// const Root = ({store}) => {
//   return (
//     <Provider store={store}>
//       <Router history={hashHistory}>
//         // <PokemonIndexContainer />
//         <Route path="/" component={PokemonIndexContainer} onEnter="ON_ENTER_CALLBACK"></Route>
//       </Router>
//     </Provider>
//   );
// };
//
// const Inside = (props) => {
//   return (
//     <div>
//       <p>WOAH INSIDE</p>
//       { props.children}
//     </div>
//   )
// }
//
// const Wrapper = (props) => {
//   debugger
//   return (
//     <div>
//       <p>HELLO</p>
//       <Inside >
//         <div> hidden</div>
//       </Inside>
//       { props.children }
//     </div>
//   )
// }

// const routes = (
//   <Route component={App} path="/">
//     <IndexRoute component={TweetsIndex} />
//     <Route component={TweetForm} path="new" />
//   </Route>
// );
//
// const connectedApp = (
//   <Provider store={ store }>
//     <Router history={hashHistory}>
//       {routes}
//     </Router>
//   </Provider>
// );

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, root);
  // ReactDOM.render(<Wrapper ><div>CHILD DIV</div></Wrapper>, root);
});


// React.createElement('Root', { thesea are the props}, thesearetehchildren)
