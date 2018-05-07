export const apiSignup = (user) => {
  return (
    $.ajax({
      method: 'POST',
      url: 'api/users',
      data: { user }
    })
  );
};

export const apiLogin = (user) => {
  return (
    $.ajax({
      method: 'POST',
      url: 'api/session',
      data: { user }
    })
  );
};

export const apiLogout = () => {
  return (
    $.ajax({
      method: 'DELETE',
      url: 'api/session'
    })
  );
};
