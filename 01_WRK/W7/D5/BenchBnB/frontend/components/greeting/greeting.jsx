import React from 'react';
import {Link} from 'react-router-dom';
import { Route} from 'react-router-dom';

const Greeting = (props) => {
  const currentUser = props.currentUser;
  const logout = props.logout;

  if (currentUser) {
    const User = () => (
      <div className="user-block">
        <h2>Hello, {currentUser.username}</h2>
        <button onClick={logout}>Log Out</button>
      </div>
    );

    return <User />;
  } else if ( !(/\/\w+/).test(props.history.location.pathname) ) {
    // e.g. only "/"
    const Login = () => (
      <div className="session-links">
        <Link to='/login'>Login! </Link>
        <Link to='/signup'>Sign Up! </Link>
      </div>
    );

    return <Login />;
  } else {
    return <div></div>;
  }
};

export default Greeting;
