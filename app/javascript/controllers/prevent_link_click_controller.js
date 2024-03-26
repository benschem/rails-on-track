import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="prevent-link-click"
export default class extends Controller {
  initialize() {
    this.element.addEventListener("click", this.handleClick.bind(this));
  }

  handleClick(event) {
    if (event.target.tagName.toLowerCase() === "form") {
      event.preventDefault();
      event.stopPropagation();
    }
  }
}
