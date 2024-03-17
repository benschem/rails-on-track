import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show-form"
export default class extends Controller {
  static targets = ["form", "button"];

  connect() {
    console.log("hello from form-controller");
  }

  fire() {
    this.formTarget.classList.toggle("hidden");
    if (this.formTarget.classList.contains("hidden")) {
      this.buttonTarget.innerText = "Add";
    } else {
      this.buttonTarget.innerText = "Hide";
    }
  }
}
