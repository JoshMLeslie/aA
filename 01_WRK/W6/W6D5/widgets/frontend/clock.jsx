import React from "react";

export default class Clock extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      time: new Date(),
    };
    this.ticker = 0;
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.ticker = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.ticker);
  }

  tick() {
    this.setState({time: new Date() });
  }

  render() {
    const time = this.state.time;
    // debugger;
    const timeString = `${time.getHours()}:${time.getMinutes()}:${time.getSeconds()}`;
    return (
      <div className="clock">
        <h1>CLOCK</h1>
        <p>{timeString}</p>
      </div>
    );
  }

} // class end
