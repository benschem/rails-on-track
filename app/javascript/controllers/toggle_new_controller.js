import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show-form"
export default class extends Controller {
  static targets = ["form", "button"];

  toggle() {
    this.formTarget.classList.toggle("hidden");
    if (this.formTarget.classList.contains("hidden")) {
      this.buttonTarget.innerHTML = '<i class="fa fa-plus"></i>';
    } else {
      this.buttonTarget.innerHTML = '<i class="fa fa-chevron-up"></i>';
    }
  }
}
