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
  const handleSubmit = (e) => {
    e.preventDefault();

    const favInput = document.querySelector(".favorite-input");
    const fav = favInput.value;
    favInput.value = "";

    const newListLi = document.createElement("li");
    newListLi.textContent = fav;

    const favsList = document.getElementById("sf-places");
    favsList.appendChild(newListLi);
  };

  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleSubmit);




  // adding new photos

  // --- your code here!

    const showPhotoForm = (e) => {
      const photoFormDiv = document.querySelector(".photo-form-container");
      if (photoFormDiv.className === "photo-form-container") {
        photoFormDiv.className = "photo-form-container hidden";
      } else {
        photoFormDiv.className = "photo-form-container";
      }
    };

    const photoFormShowButton = document.querySelector(".photo-show-button");
    photoFormShowButton.addEventListener("click", showPhotoForm);


    const handlePhotoSubmit = (e) => {
      e.preventDefault();

      const photoUrlInput = document.querySelector(".photo-url-input");
      const photoUrl = photoUrlInput.value;
      photoUrlInput.value = "";

      const newImg = document.createElement("img");
      newImg.src = photoUrl;

      const newPhotoLi = document.createElement("li");
      newPhotoLi.appendChild(newImg);

      const dogPhotosList = document.querySelector(".dog-photos");
      dogPhotosList.appendChild(newPhotoLi);
    };

    const photoSubmitButton = document.querySelector(".photo-url-submit");
    photoSubmitButton.addEventListener("click", handlePhotoSubmit);


});
