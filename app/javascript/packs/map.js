// app/javascript/packs/map.js
import GMaps from 'gmaps/gmaps.js';
import { MAP_STYLE } from './map_style';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
const markers = JSON.parse(mapElement.dataset.markers);
map.addMarkers(markers);
if (markers.length === 0) {
  map.setZoom(2);
} else if (markers.length === 1) {
  map.setCenter(markers[0].lat, markers[0].lng);
  map.setZoom(16);
} else {
  map.fitLatLngBounds(markers);
}
map.addStyle({
  styles: MAP_STYLE,
  mapTypeId: 'map_style'
});
map.setStyle('map_style');
}
