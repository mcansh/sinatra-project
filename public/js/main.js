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

// HACK
function swapInputType() {
  const email = this.value;
  if (email.includes('@')) {
    this.type = 'email';
    this.name = 'email';
  } else {
    this.type = 'text';
    this.name = 'username';
  }
  console.log(email);
}

if (location.pathname === '/signin') {
  document.querySelector('#username').addEventListener('keyup', swapInputType);
  document.querySelector('#username').addEventListener('focusout', swapInputType);
}

if (location.pathname === '/signup' || location.pathname === '/signin') {
  document.querySelector('#revealpass').addEventListener('click', revealPass);
}
