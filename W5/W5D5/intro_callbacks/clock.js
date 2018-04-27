class Clock {

  constructor() {
    // 1. Create a Date object.
    const date = new Date();

    // 2. Store the hours, minutes, and seconds.
    this.seconds = date.getSeconds();
    this.minutes = date.getMinutes();
    this.hours = date.getHours();

    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    // tick start:
    // this._tick = this._tick.bind(this);
    this._tick = this._tick.bind(this);
    setInterval(this._tick, 999);
  }

  printTime() {
    // this == clock object
    // Formats time in HH:MM:SS
    // Uses console.log to print it.
    console.log(
      `${
        this.hours
      }:${
        this.minutes
      }:${
        ( (this.seconds < 10) ?  '0' + this.seconds : this.seconds )
      }`
    );
  }

  _tick() {
    // 1. Increment the time by one second.
    this.rollOver();
    this.printTime.bind(this)();
    // 2. Call printTime.
    // setInterval(this._tick(), 1000);
    // setTimeout(this._tick(), 1000);
  }

  rollOver() {
    if (this.seconds >= 59 && this.minutes >= 59 && this.hours >= 23) {
      // if everything is going to roll over
      this.seconds = 0;
      this.minutes = 0;
      this.hours = 0;
    } else if (this.seconds >= 59 && this.minutes >= 59) {
      // if an hour is going to roll over
      this.seconds = 0;
      this.minutes = 0;
      this.hours = (this.hours + 1);
    } else if (this.seconds >= 59) {
      // if a minute is going to roll over
      this.seconds = 0;
      this.minutes = (this.minutes+1);
    } else {
      // incremenet second by 1
      this.seconds = (this.seconds+1);
    }
  }


} // class end



const clock = new Clock();
// => time at creation: **:**:**
