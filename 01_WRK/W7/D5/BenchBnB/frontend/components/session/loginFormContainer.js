import React from 'react';
import { connect } from 'react-redux';
import { login } from '../../actions/session_actions';
import SessionForm from './session_form';
import { Route, Redirect, Switch, Link, HashRouter } from 'react-router-dom';

const mapStateToProps = (state) => {
  return ({
    errors: state.errors.sessionErrors,
    formType: 'login',
    formLegend: 'Login',
    navLink: <Link to="/signup">sign up</Link>,
  });
};

const mapDispatchToProps = (dispatch) => {
  return ({
    processForm: (user) => dispatch(login(user))
  });
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
