function geoloc() {
  navigator.geolocation.getCurrentPosition((position) => {
    const longitude = position.coords.longitude;
    const latitude = position.coords.latitude;
    document.querySelector("#longitude").value = longitude
    document.querySelector("#latitude").value = latitude
    document.querySelector("#geoloc").submit()
  });
}

function display() {
  const gogo = document.querySelector("#GOGO");
  gogo.addEventListener("click", (event) => {
    geoloc();
});
};

export { display };


