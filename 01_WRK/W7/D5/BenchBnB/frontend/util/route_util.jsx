import React from 'react';
import { Route, Redirect, Switch, Link, HashRouter, withRouter } from 'react-router-dom';
import { connect } from 'react-redux';

const Auth = ({component: Component, path, loggedIn, exact}) => {
  return (
    <Route
      path={path}
      exact={exact}
      render={ (props) => {
        return (
          !loggedIn ? ( <Component {...props} /> ) : ( <Redirect to='/users/show' />)
        );
      }  }
    />
  );
};

const mapStateToProps = state => {
  return {loggedIn: Boolean(state.session.id)};
};

export const AuthRoute = withRouter(connect(mapStateToProps, null)(Auth));
