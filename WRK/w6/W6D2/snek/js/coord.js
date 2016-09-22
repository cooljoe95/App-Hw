class Coord{
  constructor(x, y){
    this.x = x;
    this.y = y;
  }

  equals(otherCoord){
    return (this.x === otherCoord.x) && (this.y === otherCoord.y);
  }

  plus(otherCoord){
    return new Coord(
      this.x + otherCoord.x,
      this.y + otherCoord.y
    );
  }

  opposite(otherCoord){
    return (this.x === otherCoord.x * -1) && (this.y === otherCoord.y * -1);
  }


}
