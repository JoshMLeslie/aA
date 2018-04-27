import React from 'react';
import ReactDOM from 'react-dom'; //used for React to hook into the DOM
import MasterRender from './master_render.jsx';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');


  ReactDOM.render(
    <MasterRender />,
    root
  );
});
