import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show-form"
export default class extends Controller {
  static targets = ["formArea", "button"];

  toggle() {
    this.formAreaTarget.classList.toggle("hidden");
    if (this.formAreaTarget.classList.contains("hidden")) {
      this.buttonTarget.innerHTML = '<i class="fa fa-plus"></i>';
    } else {
      this.buttonTarget.innerHTML = '<i class="fa fa-minus"></i>';
    }
  }
}
