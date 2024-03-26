import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="sort-order"
export default class extends Controller {
  static targets = ["icon"];

  reverse() {
    fetch(this.element.href, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((data) => {
        // Handle successful response
        console.log(data);
      })
      .catch((error) => {
        // Handle error
        console.error("Error:", error);
      });
  }
}
