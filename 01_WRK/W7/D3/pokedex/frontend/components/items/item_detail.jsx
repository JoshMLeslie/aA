import React from 'react';
import { Route } from 'react-router-dom';

export default class ItemDetail extends React.Component {
  render () {
    let item = this.props.item;

    return (
      <div>
        <img src={item.image_url}></img>
        <h2>{item.name}</h2>
        <h3>{item.price}</h3>
        <h3>{item.happiness}</h3>
      </div>
    );
  }
}
