
function sendData(json) {
  // const coordinatesData = new FormData();
  // coordinatesData.append("latitude", json.lat);
  // coordinatesData.append("longitude", json.lng);
  // const request = new XMLHttpRequest();
  // request.open("POST", "/choice_trip")
  // request.send(coordinatesData);
  window.location = `/gogo?latitude=${json.lat}&longitude=${json.lng}&active_tab=map`
}

function getCoordinates() {
  const goNowButton = document.getElementById('go-now');
  goNowButton.addEventListener('click', () => {
    const url = "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyCm3AegcWerG39-2j3h24EM5i0JH-U44v0"
    fetch(url, {
    method: "POST"
  })
    .then(response => response.json())
    .then((data) => {
      sendData(data.location);
    });
  });
}


export { getCoordinates }































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
  if (gogo) {
    gogo.addEventListener("click", (event) => {
      geoloc();
    });
  }
};

export { display };



