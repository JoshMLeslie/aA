import React from "react";

export default class Tabs extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      selectedTab: 0
    };
    this.handleClick = this.handleClick.bind(this);
  }

  makeTabs () {
    return this.props.tabObjs.map ((tab, index) => {
      return (
        <div className="tabs" key={index} onClick={this.handleClick(index)}>
            {tab.title}
        </div>
      );
    });
  }

  handleClick (index) {
    return ((event) => {
      this.setState({selectedTab: index});
    }).bind(this);
  }


  render() {
    let currentTab = this.props.tabObjs[this.state.selectedTab];
    return (
      <div>
        <h1 className = "tab-header">Tabs</h1>
        {this.makeTabs()}
        {currentTab.content}
      </div>
    );
  }
}
