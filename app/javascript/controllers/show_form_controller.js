import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show-form"
export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log("helllo from form-controller");
  }

  fire() {
    this.formTarget.classList.toggle("hidden");
  }
}
