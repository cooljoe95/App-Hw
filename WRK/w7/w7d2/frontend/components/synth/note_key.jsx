import React from 'react';

// export default class NoteKey extends React.Component {
//   constructor(props){
//     super(props);
//     // debugger
//   }
//
//   render() {
//     return(
//       <li key={this.props}>{this.props}</li>
//     );
//   }
// }

export default (note_key) => {
  return (
    <li key={note_key}>{note_key}</li>
  );
};
