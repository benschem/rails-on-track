import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-edit"
export default class extends Controller {
  static targets = ["edit", "delete", "button"];

  toggle() {
    this.editTargets.forEach((editTarget) => {
      editTarget.classList.toggle("hidden");
    });
    this.deleteTargets.forEach((deleteTarget) => {
      deleteTarget.classList.toggle("hidden");
    });
    if (this.editTarget.classList.contains("hidden")) {
      this.buttonTarget.innerHTML = '<i class="fa fa-eye"></i> Show options';
    } else {
      this.buttonTarget.innerHTML =
        '<i class="fa fa-eye-slash"></i> Hide options';
    }
  }
}
