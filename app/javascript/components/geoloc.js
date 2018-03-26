// function geoloc() {
//   navigator.geolocation.getCurrentPosition((position) => {
//     const longitude = position.coords.longitude;
//     const latitude = position.coords.latitude;
//   });
// }


// const gonow = document.querySelector('#gonow');

// function display() {
//   if (gonow) {
//     fetch("https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyCm3AegcWerG39-2j3h24EM5i0JH-U44v0", {
//        method: "POST",
//        headers: {
//          "Content-Type": "application/json"
//        },
//        body: JSON.stringify({})
//      })
//        .then(response => response.json())
//        .then((data) => {
//          console.log(data);
//          console.log(data.location);// Look at local_names.default
//          console.log(data.location.lng);// Look at local_names.default
//          console.log(data.location.lat);// Look at local_names.default
//          send();
//        })
//      }
//    }


// function send() {
//   fetch("cityfind", {
//        method: "POST",
//        headers: {
//          "Content-Type": "application/json"
//        },
//        body: JSON.stringify({})
//      })
//        .then(response => response.json())
//        .then((data) => {
//          console.log(data);
//        })
// }



// export { display };


