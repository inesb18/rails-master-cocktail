const buttonAddIngredient = document.getElementById("btn-new-ingredient");

const makeFormAppear = () => {
  if (buttonAddIngredient) {
    buttonAddIngredient.addEventListener('click',(event) => {
      const form = document.getElementById("form");
      form.classList.remove('hide');
      event.currentTarget.classList.add('hide');
    })
  }
};


export { makeFormAppear };
