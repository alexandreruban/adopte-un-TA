function addClickAvatar() {
 const avatar = document.getElementById('avatar-menu');
 const dropMenu = document.querySelector('.drop-menu');
 avatar.addEventListener('click', (event) => {
    dropMenu.classList.toggle('drop-menu-visible');
  })
}

function togglerNav() {
  const toggleBar = document.querySelector('.toggler-bar');
  toggleBar.addEventListener('click', (event) => {
    console.log('coucu')
  })
}

export { addClickAvatar, togglerNav };
