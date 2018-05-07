import React from 'react';
import {Link} from 'react-router-dom';


const Greeting = ({currentUser, logout}) => {
  if (currentUser) {
    return (
      <div className="user-block">
        <h2>Hello, {currentUser.username}</h2>
        <button onClick={logout}>Log Out</button>
      </div>
    );
  } else {
    return (
      <div className="session-links">
        <Link to='/login'>Login! </Link>
        <Link to='/signup'>Sign Up! </Link>
      </div>
    );
  }

};

export default Greeting;
