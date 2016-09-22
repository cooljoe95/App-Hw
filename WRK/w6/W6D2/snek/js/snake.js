class Snake {
  constructor(start_pos){
    this.directions = ['up', 'down', 'left', 'right'];
    this.direction = this.directions[0];
    this.segments = [start_pos];
  }


} 

module.exports = Snake;
