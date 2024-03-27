import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show-form"
export default class extends Controller {
  static targets = ["form", "button"];

  toggle() {
    this.formTarget.classList.toggle("hidden");
    if (this.formTarget.classList.contains("hidden")) {
      this.buttonTarget.innerHTML =
        '<i class="fa fa-plus" aria="hidden"></i> New Habit';
    } else {
      this.buttonTarget.innerHTML =
        '<i class="fa fa-chevron-up" aria="hidden"></i> Hide Form';
    }
  }
}
