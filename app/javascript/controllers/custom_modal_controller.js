import { Modal } from "tailwindcss-stimulus-components"
import { Turbo } from "@hotwired/turbo-rails"
export default class extends Modal {
  static targets = ["loading", "frame"]
  
  openAndVisit(e) {
    this.open(e)
    Turbo.visit(e.currentTarget.href || e.currentTarget.dataset.modalPath, { frame: "modal_body" });
    this._removeAllChildren(this.frameTarget)  
    this.frameTarget.appendChild(this.loadingTarget.content.cloneNode(true));
  }

  _removeAllChildren(parent){
    while (parent.firstChild) {
      parent.removeChild(parent.firstChild);
    }
  }
  
}
