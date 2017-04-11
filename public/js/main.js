function revealPass() {
  if (document.querySelector('#password').type === 'text') {
    document.querySelector('#password').type = 'password';
    this.title = 'show password';
    document.querySelector('#eye use').href.baseVal = '/img/sprite.svg#eye';
  } else {
    document.querySelector('#password').type = 'text';
    this.title = 'hide password';
    document.querySelector('#eye use').href.baseVal = '/img/sprite.svg#eye-off';
  }
}
if (location.pathname === '/signup' || location.pathname === '/signin') {
  document.querySelector('#revealpass').addEventListener('click', revealPass);
}
