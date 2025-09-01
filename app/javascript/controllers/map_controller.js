import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [2.3522, 48.8566], // Paris par défaut
      zoom: 6 // Zoom pour voir la France entière
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  disconnect() {
    this.map?.remove()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // Créer un popup avec les infos de l'événement
      const popup = new mapboxgl.Popup().setHTML(`
        <div class="mapbox-popup">
          <h6>${marker.info_window}</h6>
        </div>
      `)

      // Créer le marker
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    if (this.markersValue.length === 0) return

    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))

    this.map.fitBounds(bounds, {
      padding: 50,
      maxZoom: 12
    })
  }
}
