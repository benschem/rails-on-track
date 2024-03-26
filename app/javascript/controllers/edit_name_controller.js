import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="edit-name"
export default class extends Controller {
  static targets = ["name", "form"];

  edit() {
    this.nameTarget.classList.toggle("hidden");
    this.formTarget.classList.toggle("hidden");
  }
}
