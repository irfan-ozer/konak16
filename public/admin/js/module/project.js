// this a jQuery event that is fired when document is ready. It allows us to start using useful jQuery selectors
$( document ).ready(function() {

    // create a Google Maps map variable
    var map;

    var canvas = $('#map-canvas'),
        dataLat = canvas.attr('data-lat'),
        dataLng = canvas.attr('data-lng'),
        lat,
        lng;

    if (dataLat !== undefined && dataLat !== false) {
        lat = parseFloat(dataLat);
    }

    if (dataLng !== undefined && dataLng !== false) {
        lng = parseFloat(dataLng);
    }

    // create a location variables
    var myLocation = new google.maps.LatLng(lat, lng);

    // create a pop-up window variable
    var myInfoWindow = new google.maps.InfoWindow();

    // A function to create the marker and InfoWindow
    function createMarkerAndInfoWindow(location, name, html) {
        // create marker for location provided
        var marker = new google.maps.Marker({
            position : location,
            map: map,
            title: 'Proje lokasyonunu belirlemek için lütfen işaretleyiciyi sürükleyip ' +
            'bırakınız.',
            draggable: true
        });

        // Add listener on market which will show infoWindow when clicked
        google.maps.event.addListener(marker, "click", function() {
            myInfoWindow.setContent(html);
            myInfoWindow.open(marker.getMap(), marker);
        });

        // Add listener on 'drag end' event, add logitude and latitude to beginning of table
        google.maps.event.addListener(marker, 'dragend', function(evt){
            var textToInsert = '';
            textToInsert = evt.latLng.lat().toFixed(5) + ', ' + evt.latLng.lng().toFixed(5);
            $(".latlng").val(textToInsert);
        });

        // listener on drag event
        google.maps.event.addListener(marker, 'dragstart', function(evt){
            // nothing for now
        });

        return marker;
    }

    function initialize() {
        var mapOptions = {
            zoom : 15,
            center : myLocation,
            draggable: true,
            mapTypeId : google.maps.MapTypeId.ROADMAP
        };

        // create the map
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

        var input = /** @type {!HTMLInputElement} */(
            document.getElementById('pac-input'));
        var types = document.getElementById('type-selector');
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);


        var infowindow = new google.maps.InfoWindow();
        // add marker
        var marker = createMarkerAndInfoWindow(myLocation, "myMarkerName",
            'Proje lokasyonunu belirlemek için lütfen işaretleyiciyi sürükleyip ' +
            'bırakınız.');
        marker.setMap(map);

//            var infowindow = new google.maps.InfoWindow();
//            var marker = new google.maps.Marker({
//                map: map,
//                anchorPoint: new google.maps.Point(0, -29)
//            });


        autocomplete.addListener('place_changed', function() {
            infowindow.close();
            marker.setVisible(false);
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                window.alert("Autocomplete's returned place contains no geometry");
                return;
            }

            // If the place has a geometry, then present it on a map.
            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);  // Why 17? Because it looks good.
            }
            marker.setIcon(/** @type {google.maps.Icon} */({
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(35, 35)
            }));
            marker.setPosition(place.geometry.location);
            marker.setVisible(true);

            var address = '';
            if (place.address_components) {
                address = [
                    (place.address_components[0] && place.address_components[0].short_name || ''),
                    (place.address_components[1] && place.address_components[1].short_name || ''),
                    (place.address_components[2] && place.address_components[2].short_name || '')
                ].join(' ');
            }

            infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
            infowindow.open(map, marker);
        });




        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
            var radioButton = document.getElementById(id);
            radioButton.addEventListener('click', function() {
                autocomplete.setTypes(types);
            });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);
    }

    // add a listener to the window object, which as soon as the load event is
    // triggered (i.e. "the page has finished loading") executes the function "initialize"
    google.maps.event.addDomListener(window, 'load', initialize);

});  // end document ready