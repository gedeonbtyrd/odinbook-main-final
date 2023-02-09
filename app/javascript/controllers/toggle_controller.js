import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "toToggle" ]
  static classes = [ "change" ]

  switch() {
    this.toToggleTarget.classList.toggle(this.changeClass)
  }
}
