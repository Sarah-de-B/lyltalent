import { Controller } from "@hotwired/stimulus";
import Splide from '@splidejs/splide';
// import { URLHash } from '@splidejs/splide-extension-url-hash';

// Connects to data-controller="carousel"
export default class extends Controller {
  connect() {
  //   var splide = new Splide( this.element, {
  //     type   : 'loop',
  //     padding: '5rem',
  //   } );

  //   splide.mount();
  // }
    var splide = new Splide( this.element );
    splide.mount();
  }
}





  //   const splide = new Splide( this.element, {
  //     perPage    : 3,
  //     perMove    : 1,
  //     height     : '9rem',
  //     focus      : 'center',
  //     trimSpace  : false,
  //     breakpoints: {
  //       600: {
  //         perPage: 2,
  //         height : '6rem',
  //       },
  //     },
  //   } );

  //   splide.mount( { URLHash } );
  // }
