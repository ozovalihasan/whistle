import { Tabs } from "tailwindcss-stimulus-components"

export default class extends Tabs {
  next(){
    this.index = (this.index + 1) % this.tabTargets.length
  }  

  previous(){
    if (this.index == 0) {
      this.index += this.tabTargets.length -1
    } else {
      this.index = (this.index - 1) % this.tabTargets.length
    }
  }  

}
