import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="focus"
export default class extends Controller {
  static targets = ["grid", "card", "show"]

  focus(event) {
    this.cardTarget.dataset.test = "test";
    console.log(this.cardTarget);
  }
}
