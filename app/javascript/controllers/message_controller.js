import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
  static values = { userId: Number }
  static targets = [ "imgUser", "imgOther" ]
  connect() {
    console.log("hekki")
    // triggered when a new message is added to the page
    const currentUserId = parseInt(document.body.dataset.currentUserId, 10);
    if (this.userIdValue === currentUserId) {
      this.element.classList.add('current-user');
      this.element.classList.remove('other-user');
      this.imgUserTarget.classList.add('d-none');
      this.imgOtherTarget.classList.remove('d-none');
    } else {
      this.element.classList.add('other-user');
      this.element.classList.remove('current-user');
      this.imgUserTarget.classList.remove('d-none');
      this.imgOtherTarget.classList.add('d-none');
    }
    this.element.scrollIntoView({ behavior: 'smooth' }); // scroll to the bottom of the page
  }
}
