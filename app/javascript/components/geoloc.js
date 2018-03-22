function geoloc() {
  navigator.geolocation.getCurrentPosition((position) => {
    const longitude = position.coords.longitude;
    const latitude = position.coords.latitude;
    console.log(longitude, latitude)
  });
}
