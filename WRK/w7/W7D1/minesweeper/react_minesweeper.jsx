import React from 'react';
import ReactDOM from 'react-dom';
import * as Minesweeper from './components/minesweeper.js';
import Board from './board.jsx';
import Tile from './tile.jsx';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(3,1)
    };

    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(event) {
    debugger
    event.currentTarget.value.explore();
  }

  render() {
    return (
      <div>
        <Board
          board={this.state.board}
          updateGame={this.updateGame}
        />
      </div>
    );
  }

}

document.addEventListener("DOMContentLoaded", ()=>{
  ReactDOM.render(
    <Game />, document.getElementById("root")
  );
});
