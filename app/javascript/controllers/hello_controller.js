import { Controller } from "@hotwired/stimulus"
import "swiper/css/bundle"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
