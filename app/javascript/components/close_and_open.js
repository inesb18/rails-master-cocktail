const closeContainer = (closeButton, openButton, container) => {
  if (closeButton) {
    closeButton.addEventListener('click', (event) => {
      if (container) {
        container.classList.add("invisible");
        closeButton.classList.add("invisible");
        if (openButton) {
          openButton.classList.remove('invisible');
        }
      }
    })
  }
};


const openContainer = (closeButton, openButton, container) => {
  if (openButton) {
    openButton.addEventListener('click',(event) => {
      if (container) {
        container.classList.remove('invisible');
        openButton.classList.add('invisible');
        if (closeButton){
          closeButton.classList.remove('invisible');
        }
      }
    })
  }
};


export { openContainer, closeContainer }
