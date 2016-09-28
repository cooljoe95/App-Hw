import React from 'react';
import Tile from './tile.jsx';

const Board = ({ board, updateGame }) => {
  const singleTile = board.grid.map((row, idx1) => {
    const singleRow = row.map((col, idx2) => {
        return <Tile tile={col} onClick={updateGame} />;
    });
    return(
      <ul>
        <li>{singleRow}</li>
      </ul>
    )
  });

  return (
    <div>
      {singleTile}
    </div>
  );
};

export default Board;
