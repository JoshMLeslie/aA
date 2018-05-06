export const apiSignup = (user) => {
  $.ajax({
    method: 'POST',
    url: 'api/users',
    data: { user }
  });
};

export const apiLogin = (user) => {
  $.ajax({
    method: 'POST',
    url: 'api/session',
    data: { user }
  });
};

export const apiLogout = () => {
  $.ajax({
    method: 'DELETE',
    url: 'api/session'
  });
};
