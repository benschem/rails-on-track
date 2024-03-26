import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="edit-name"
export default class extends Controller {
  static targets = ["name", "pencil"];

  edit(event) {
    const clickedTarget = event.currentTarget;
    clickedTarget.classList.toggle("hidden");
    this.formTarget.classList.toggle("hidden");
  }
}
