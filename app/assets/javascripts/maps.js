$("#myBtn").click(function(){
        $("#myModal").modal();
    });


function initMap() {
  var coordinates = [{lat: 40.1720, lng: -3.6567 },
                    {lat: 40.4000, lng: -3.7167 },
                    {lat: 40.3805031, lng: -3.6336483 },
                    {lat: 40.20561439999999, lng: -4.0882782 }]
  var map = new google.maps.Map(document.getElementById('map'), {
   zoom: 9,
   center: coordinates[0]
});

//Contenido del infowindow de las coordenadas
  coordinates.forEach(function(coords){
     var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
      'sandstone rock formation in the southern part of the '+
      'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
      'south west of the nearest large town, Alice Springs; 450&#160;km '+
      '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
      'features of the Uluru - Kata Tjuta National Park. Uluru is '+
      'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
      'Aboriginal people of the area. It has many springs, waterholes, '+
      'rock caves and ancient paintings. Uluru is listed as a World '+
      'Heritage Site.</p>'+
      '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
      'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
      '(last visited June 22, 2009).</p>'+
      '</div>'+
      '<button type="button" class="btn btn-info btn-lg" id="myBtn">Contact</button>'

    var info_content = '<p>Esto es Latitud: ' + coords['lat'] + ' </p><p>Esto es Longitud:  </p>'
    
    //Cómo va a pintar el marcador
    var marker = new google.maps.Marker({
     position: coords,
     map: map,
     title: 'TITLE HERE',
     icon: '/assets/marker.png'
    });

    //Contenido que irá en el infowindow
    var info_window = new google.maps.InfoWindow({
     content: contentString,
     position : coords
    });

    marker.addListener('click', function() {
     info_window.open(map, marker);
    });
  })
}

//Función que pinta los marcardores
function createMarker(position, address){
  var marker = new google.maps.Marker({
      position: position,
      map: map,
      title: 'Hello World!'
    });

  // var infowindow = new google.maps.InfoWindow({
  //     content: address
  //   });

  //   marker.addListener('click', function() {
  //     infowindow.open(map, marker);
  //   });
}

//Almacena y muestra los marcadores desde localStorage
function showMarkers(){

  var locations = JSON.parse(window.localStorage.getItem("locations")) || [] ;

  if(locations){
    locations.forEach(function showMarkers (location) {
      createMarker(location.position, location.address);
    });
  }

}  

function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}


// function setupAutocomplete(){
//   var input = $('#get-places')[0];
//   var autocomplete = new google.maps.places.Autocomplete(input);
//   autocomplete.addListener('place_changed', function(){
//     var place = autocomplete.getPlace();
//     if (place.geometry.location) {
//       map.setCenter(place.geometry.location);
//       map.setZoom(17);

//       var locations = JSON.parse(window.localStorage.getItem("locations")) || [] ;
//       locations.push({position: place.geometry.location, address: place.formatted_address});
//       window.localStorage.setItem( "locations" , JSON.stringify(locations));

//       createMarker(place.geometry.location, place.formatted_address);
//     } else {
//       alert("The place has no location...?")
//     }
//   });
// }




/////////////////////////// Don't touch
// function initMap() {
  
//   var coordinates = [{lat: 40.1720, lng: -3.6567 },
//                     {lat: 40.4000, lng: -3.7167 },
//                     {lat: 40.3805031, lng: -3.6336483 },
//                     {lat: 40.20561439999999, lng: -4.0882782 }]
                    

//   var map = new google.maps.Map(document.getElementById('map'), {
//    zoom: 8,
//    center: coordinates[0]
//   });

//   coordinates.forEach(function(coords){
//     var info_content = '<p>Esto es Latitud: ' + coords['lat'] + ' </p><p>Esto es Longitud:  </p>'
//     var marker = new google.maps.Marker({
//      position: coords,
//      map: map,
//      title: 'TITLE HERE',
//      icon: '/assets/marker.png'
//     });

//     var info_window = new google.maps.InfoWindow({
//      content: info_content,
//      position : coords
//     });

//     marker.addListener('click', function() {
//      info_window.open(map, marker);
//     });
//   })
// }      

// function geocodeAddress(geocoder, resultsMap) {
//   var address = document.getElementById('address').value;
//   geocoder.geocode({'address': address}, function(results, status) {
//     if (status === google.maps.GeocoderStatus.OK) {
//       resultsMap.setCenter(results[0].geometry.location);
//       var marker = new google.maps.Marker({
//         map: resultsMap,
//         position: results[0].geometry.location
//       });
//     } else {
//       alert('Geocode was not successful for the following reason: ' + status);
//     }
//   });
// }