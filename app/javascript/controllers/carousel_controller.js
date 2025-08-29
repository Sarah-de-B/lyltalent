import { Controller } from "@hotwired/stimulus";
import Splide from '@splidejs/splide';

// Connects to data-controller="carousel"
export default class extends Controller {
  connect() {
    const splide = new Splide(this.element, {
      arrows: false,
    });

    splide.mount();
  }
}
