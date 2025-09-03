import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  remove(event) {
    event.preventDefault() // bloque la navigation immédiate

    // Récupère l'URL du lien
    const url = this.element.getAttribute("href")

    // Ajoute la classe pour l'animation CSS
    this.element.classList.add("removed")

    // Après la fin de l'animation, supprime la card et redirige
    setTimeout(() => {
      this.element.remove()
      if (url) {
        window.location.href = url
      }
    }, 300) // durée de l'animation en ms 
  }
}
