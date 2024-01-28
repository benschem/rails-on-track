import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="habit"
export default class extends Controller {
  static targets = ["habit"];

  connect() {
    console.log(this.element);
    console.log(this.habitTarget);
    // console.log(this.formTarget);
  }
}
