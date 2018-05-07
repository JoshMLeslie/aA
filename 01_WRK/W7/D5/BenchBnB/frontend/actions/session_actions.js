import { apiLogin, apiLogout, apiSignup } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

export const signup = (user) => dispatch => {
  apiSignup(user).then(
    user => {
      return (
        dispatch(receiveCurrentUser(user))
      );
    },
    err  => {
      return (
        dispatch(receiveErrors(err.responseJSON))
      );
    }
  );
};

export const login = (user) => dispatch => {
  apiLogin(user).then(
    user => {
      return (
        dispatch(receiveCurrentUser(user))
      );
    },
    err  => {
      return (
        dispatch(receiveErrors(err.responseJSON))
      );
    }
  );
};

export const logout = (user) => dispatch => {
  apiLogout(user).then(
    () => { return (dispatch(logoutCurrentUser ()) ); }
  );
};

export const receiveCurrentUser = currentUser => {
  return ({
    type: RECEIVE_CURRENT_USER,
    currentUser
  });
};

export const logoutCurrentUser = () => {
  return ({
    type: LOGOUT_CURRENT_USER,
  });
};

export const receiveErrors = (errors) => {
  return ({
    type: RECEIVE_SESSION_ERRORS,
    errors
  });
};
