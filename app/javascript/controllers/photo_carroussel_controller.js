import { Controller } from "@hotwired/stimulus"
import Splide from '@splidejs/splide';

// Connects to data-controller="photo-carroussel"
export default class extends Controller {
  connect() {
    var splide = new Splide( '.splide', {
      type  : 'fade',
      rewind: true,
    } );

    splide.mount();
  }
}
