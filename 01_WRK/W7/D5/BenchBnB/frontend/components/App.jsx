import React from 'react';
import Greeting from './greeting/greeting_container';
import LoginFormContainer from './session/loginFormContainer';
import SignupFormContainer from './session/signupFormContainer';
import { Route, Redirect, Switch, Link, HashRouter } from 'react-router-dom';
import { AuthRoute } from '../util/route_util';

const App = () => {
  return (
    <div>
      <header>
        <h1>ParkBench BnB</h1>
        <Greeting />
      </header>

      <AuthRoute path="/login" component={ LoginFormContainer } />
      <AuthRoute path="/signup" component={ SignupFormContainer } />
    </div>
  );
};

export default App;
