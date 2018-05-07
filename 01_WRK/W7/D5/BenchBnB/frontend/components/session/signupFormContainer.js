import React from 'react';
import { connect } from 'react-redux';
import { signup } from '../../actions/session_actions';
import SessionForm from './session_form';
import { Route, Redirect, Switch, Link, HashRouter } from 'react-router-dom';

const mapStateToProps = (props) => {
  return ({
    errors: props.errors,
    formType: 'signup',
    navLink: <Link to="/login">login</Link>,
  });
};

const mapDispatchToProps = (dispatch) => {
  return ({
    processForm: (user) => dispatch(signup(user))
  });
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
