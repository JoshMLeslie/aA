import React from "react";
import Clock from './clock.jsx';
import Tabs from './tabs.jsx';
// import Weather from './weather.jsx';

export default class MasterRender extends React.Component {

  render() {
    const TABNAMES = [
      {title: "one", content: "one stuff"},
      {title: "two", content: "two stuff"},
      {title: "three", content: "three stuff"}
    ];


    return (
      <div className = "master-render">
        <Clock />
        <Tabs tabObjs={TABNAMES}/>
      </div>
    );
  }
  // <Weather />

}
