// const MovingObject = require('./lib/moving_object.js');
// const Game = require('./lib/game.js');
const GameView = require('./lib/gameView.js');

const canvasEl = document.getElementsByTagName("canvas")[0];
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;

// const movingObj = new MovingObject(
//   {
//     pos: [40, 40],
//     vel: [10, 10],
//     radius: 10,
//     color: "#749EF2"
//   }
// );
// movingObj.draw(canvasEl);//.start(canvasEl);
// movingObj.move().draw(canvasEl);

const game = new GameView(canvasEl);
game.start();
