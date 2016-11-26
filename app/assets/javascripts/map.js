function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 16
  });
  var infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}

//
// function initMap() {
//   var pos = {lat: 40.730610, lng: -73.935242};
//   var map = new google.maps.Map(document.getElementById('map'), {
//     center: pos, //defaulted to NYC lng/lat
//     zoom: 6
//   });
//   var marker = new google.maps.Marker({
//     position: pos,
//     map: map,
//     title: 'a'
//   });
//   var infoWindow = new google.maps.InfoWindow({map: map});
//   if (navigator.geolocation) {
//     navigator.geolocation.watchPosition(function(position) {
//       var pos = {
//         lat: position.coords.latitude,
//         lng: position.coords.longitude
//       };
//       console.log(pos);
//
//       infoWindow.setPosition(pos);
//       infoWindow.setContent('Location found.');
//       map.setCenter(pos);
//       marker.setPosition(pos);
//
//
//     }, function() {
//       handleLocationError(true, infoWindow, map.getCenter());
//     });
//   } else {
//     // Browser doesn't support Geolocation
//     handleLocationError(false, infoWindow, map.getCenter());
//   }
//   return pos;
//   }
//
//   function handleLocationError(browserHasGeolocation, infoWindow, pos) {
//   infoWindow.setPosition(pos);
//   infoWindow.setContent(browserHasGeolocation ?
//                         'Error: The Geolocation service failed.' :
//                         'Error: Your browser doesn\'t support geolocation.');
//   }
//
//   var watchID = null;
//
//    // PhoneGap is ready
//    //
//    function f() {
//        // Update every 1 ms seconds
//        var options = {enableHighAccuracy: true,timeout: 5000,maximumAge: 0,desiredAccuracy: 0, frequency: 1 };
//        watchID = navigator.geolocation.watchPosition(onSuccess, onError, options);
//    }
//
//    // onSuccess Geolocation
//    //
//    function onSuccess(position) {
//      var str =  'Latitude: '  + position.coords.latitude      + '<br>' +
//                 'Longitude: ' + position.coords.longitude     + '<br>' +
//                 'Timestamp: ' + position.timestamp     + '<br>\r\n' ;
//        document.getElementById('result').value += str;
//    }
//
//    // clear the watch that was started earlier
//    //
//    function clearWatch() {
//        if (watchID !== null) {
//            navigator.geolocation.clearWatch(watchID);
//            watchID = null;
//        }
//    }
//
//    // onError Callback receives a PositionError object
//    //
//    function onError(error) {
//      alert('position error code: ' + error.code + '\n' +
//       'message: ' + error.message + '\n');
//    }
//
// //   $( document ).ready(function() {
// //   alert('hello');
// //   $('form').click(function(event) {
// //     event.preventDefault();
// //     var pos = initMap();
// //
// //     alert('lat:' + pos.lat + " " + 'long:' + pos.lng);
// //   })
// // });
//
//   $(document).ready(function() {
//     $('button').click(function() {
//     f();
//   });
// });
