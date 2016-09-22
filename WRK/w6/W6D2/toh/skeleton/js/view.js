class HanoiView {
  constructor(game, $el){
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.render();
    this.fromTower = null;
    this.bindEvents();
  }

  setupTowers(){
    for(let i = 0; i < 3; i++){
      const $ul = $("<ul>");
      $ul.data('tower', i);
      for (let j = 2; j >= 0; j--) {
        const $li = $('<li>');
        $li.data('pos', [i, j]);
        $ul.append($li);
      }
      this.$el.append($ul);
    }
  }

  render() {
    const $li = $('li');
    $li.removeClass();
    for(let i = 0; i < $li.length; i++){
      const $currentLi = $($li[i]);
      const pos = $currentLi.data('pos');
      const diskSize = this.game.towers[pos[0]][pos[1]];
      if(diskSize){
        $currentLi.addClass('disk');
        $currentLi.addClass(`disk-${diskSize}`);
      }
    }
  }

  bindEvents(){
    const $ul = $('ul');
    $ul.on("click", function(e) {
      const $currentTarget = $(e.currentTarget);
      this.clickTower($currentTarget);
      if(this.game.isWon()){
        const $h1 = $("<h1>");
        $h1.text("Congratulations!!! You Win!!!");
        this.$el.append($h1);
        $ul.off();
        this.restartGame();
      }
    }.bind(this));
  }

  restartGame(){
    const $button = $('<a>');
    $button.attr("href", "file:///Users/appacademy/Desktop/skeleton/toh/skeleton/index.html");
    $button.text("Restart Game");
    this.$el.append($button);
  }

  clickTower($tower) {
    if (this.fromTower === 0 || this.fromTower) {
      const toTower = $tower.data('tower');
      if(!this.game.move(this.fromTower, toTower)){
        alert("What you thinking about Willis?");
      }
      this.fromTower = null;
      $('ul').removeClass();
    } else {
      this.fromTower = $tower.data('tower');
      $tower.addClass('selected-tower');
    }
    this.render();
  }
}
module.exports = HanoiView;
