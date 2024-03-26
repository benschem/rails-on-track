import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="close-flash"
export default class extends Controller {
  static targets = ["flash", "button"];

  close() {
    this.flashTarget.remove();
  }
}
