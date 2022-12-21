import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["add_item", "template"]

  add_association(event) {
    event.preventDefault()
    var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime().toString())
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content)
  }
}