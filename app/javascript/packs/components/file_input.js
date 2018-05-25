function inputFileUpdate() {
  const labelContainer = document.querySelector('.file');
  const label = labelContainer.firstElementChild;
  const input = labelContainer.lastElementChild;
  if (input) {
    input.addEventListener('change', (event) => {
      label.innerText = event.target.files[0].name;
    })
  }
}

export { inputFileUpdate };
