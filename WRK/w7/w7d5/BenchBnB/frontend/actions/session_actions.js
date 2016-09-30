export const LOGIN = "LOGIN";
export const LOGOUT = "LOGOUT";
export const SIGNUP = "SIGNUP";
export const RECEIVE_ERRORS = "RECEIVE ERRORS";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";

export const logout = () => {
  return {
    type: LOGOUT
  };
};

export const login = (user) => {
  return {
    type: LOGIN,
    user
  };
};

export const signup = (user) => {
  return {
    type: SIGNUP,
    user
  };
};

export const receiveErrors = (errors) => {
  return {
    type: RECEIVE_ERRORS,
    errors
  };
};

export const receiveCurrentUser = (currentUser) => {
  return {
    type: RECEIVE_CURRENT_USER,
    user: currentUser
  };
};
