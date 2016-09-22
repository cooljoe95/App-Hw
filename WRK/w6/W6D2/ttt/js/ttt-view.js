class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    $('.square').on('click', function(e) {
      const $currentTarget = $(e.currentTarget);
      this.makeMove($currentTarget);
      if (this.game.isOver()) {
        const $h1 = $('<h1>');
        if (this.game.winner()) {
          $h1.text(`🎉Congratulations ${this.game.winner().toUpperCase()}!🎉`);
        } else {
          $h1.text("It's a draw 😨");
        }
        $('body').append($h1);
        $('.square').off();
        this.restartGame();
      }
    }.bind(this));
  }

  makeMove($square) {
    try {
      const pos = $square.data('pos');
      this.game.playMove(pos);
      $square.text(this.game.board.grid[pos[0]][pos[1]]);
      $square.addClass('clicked');
      $square.addClass($square.text());
    } catch(MoveError) {
      alert(MoveError.msg);
    }
  }

  setupBoard() {
    const $ul = $('<ul>');
    this.$el.append($ul);
    for(let i = 0; i < 3; i++){
      for (let j = 0; j < 3; j++) {
        const $li = $('<li>');
        $li.addClass('square');
        $li.data("pos", [i,j]);
        $ul.append($li);
      }
    }

    this.bindEvents();
  }

  restartGame() {
    const $button = $('<a>');
    $button.attr("href", "file:///Users/appacademy/Desktop/skeleton/ttt/index.html");
    $button.text("Restart Game");
    $('body').append($button);
  }
}

module.exports = View;
