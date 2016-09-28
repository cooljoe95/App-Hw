import React from 'react';

const Tile = ({ tile, updateGame }) => {
  if(tile.explored && !tile.bombed){
    return <h3>tile.adjacentBombCount()</h3>;
  } else if(tile.explored && tile.bombed){
    return <h3>💣</h3>;
  } else if(tile.flagged){
    return <h3>🎌</h3>;
  } else {
    return <h3>T</h3>;
  }
};

export default Tile;
