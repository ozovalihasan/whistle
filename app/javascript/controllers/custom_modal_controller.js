import { Modal } from "tailwindcss-stimulus-components"
import { Turbo } from "@hotwired/turbo-rails"
export default class extends Modal {
  openAndVisit(e) {
    this.open(e)
    Turbo.visit(e.currentTarget.href || e.currentTarget.dataset.path, { frame: "modal_body" });
  }
}
