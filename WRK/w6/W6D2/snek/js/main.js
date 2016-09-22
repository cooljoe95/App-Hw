const Snake = require('./snake.js');
const SnakeView = require('./view.js');

$( () => {
  const rootEl = $('.snake');
  const game = new Snake();
  new SnakeView(game, rootEl);


  $('body').append($('<h1>').text('SNEK!'));
});
