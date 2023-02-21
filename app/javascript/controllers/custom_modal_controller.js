import { Modal } from "tailwindcss-stimulus-components"

export default class extends Modal {
  static targets = ["defaultAnchor"]

  sendRequest(e) {
    this.defaultAnchorTarget.click();
    this.open(e)
  }
}
