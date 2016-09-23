document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const div = document.getElementsByClassName("list-container")[0];

  const form = div.getElementsByTagName("form")[0];
  form.addEventListener("submit", event => {

    event.preventDefault();
    const inputEl = form.getElementsByClassName("favorite-input")[0];
    const favorite = inputEl.value;
    inputEl.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = favorite;

    ul.appendChild(li);

  });

  // adding new photos

  // --- your code here!

  const photoFormShowButton = document.getElementsByClassName("photo-show-button")[0];
  photoFormShowButton.addEventListener("click", function(e) {
    const formDiv = document.getElementsByClassName("photo-form-container")[0];
    if (formDiv.className === "photo-form-container") {
      formDiv.className = "photo-form-container hidden";
    } else {
      formDiv.className = "photo-form-container";
    }
  });



  const photoSubmitButton = document.getElementsByClassName("photo-url-submit")[0];
  photoSubmitButton.addEventListener("click", (e) => {
    e.preventDefault();

    const photoUrlInput = document.getElementsByClassName("photo-url-input")[0];
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoUrl;

    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);

    const dogPhotosList = document.getElementsByClassName("dog-photos")[0];
    dogPhotosList.appendChild(newPhotoLi);
  });

});
