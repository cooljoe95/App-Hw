// Callbacks Exercises

class Clock {
  constructor() {
    const date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    setInterval(this._tick.bind(this), 1000);
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime() {
    let hour, minute, second;

    hour = this.hours < 10 ? `0` + this.hours : this.hours;
    minute = this.minutes < 10 ? `0` + this.minutes : this.minutes;
    second = this.seconds < 10 ? `0` + this.seconds : this.seconds;

    console.log(`${hour}:${minute}:${second}`);
    // Format the time in HH:MM:SS
                          // 9:5:3
                          // 09:05:03
    // Use console.log to print it.
  }

  _tick() {

    if(this.seconds + 1 === 60){
      this.seconds = 0;
      if(this.minutes + 1 === 60){
        this.minutes = 0;
        if(this.hours + 1 === 24){
          this.hours = 0;
        } else {
          this.hours++;
        }
      } else {
        this.minutes++;
      }
    } else {
      this.seconds++;
    }
    this.printTime();
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }
}

const clock = new Clock();
