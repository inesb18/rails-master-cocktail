
const ratingForm = document.querySelector(".rating-stars");

const empty = (element) => {
  element.classList.remove("fas");
  element.classList.add("far");
};

const fill = (element) => {
  element.classList.remove("far");
  element.classList.add("fas");
};

const rates = (nb_stars) => {
  let element = document.getElementById(nb_stars);
  fill(element);
  while ( element = element.previousSibling ){
    if (element.tagName === 'I') {
      fill(element);
    }
  }
  element = document.getElementById(nb_stars);
  while ( element = element.nextSibling ){
    if (element.tagName === 'I') {
      empty(element);
    }
  }
}

const responsiveRatingStars = () => {

  if (ratingForm) {
    ratingForm.addEventListener("mouseleave", (event) => {
      rates(document.getElementById("rating-input").value)
    })
    ratingForm.querySelectorAll("i").forEach((star) => {
      star.addEventListener("mouseover", (event) => {
        const element = event.currentTarget;
        rates(element.id);
      })
      star.addEventListener("click", (event) => {
        const element = event.currentTarget;
        document.getElementById("rating-input").value = element.id;
      })
    })
  }

}

export { responsiveRatingStars }
