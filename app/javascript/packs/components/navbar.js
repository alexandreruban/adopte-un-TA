function addClickAvatar() {
 const avatar = document.getElementById('avatar-menu');
 const dropMenu = document.querySelector('.drop-menu');
 avatar.addEventListener('click', (event) => {
    dropMenu.classList.toggle('drop-menu-visible');
  })
}

function togglerNav() {
  const toggleBar = document.querySelector('.toggler-bar');
  const navigation= document.querySelector('.navigation-wrapper-small');
  const linksSmall = document.querySelector('.links-small');
  toggleBar.addEventListener('click', (event) => {
    navigation.classList.toggle('full');
    linksSmall.classList.toggle('links-small-visible');
  })
}

export { addClickAvatar, togglerNav };
