import { Tabs } from 'tailwindcss-stimulus-components'

export default class extends Tabs {
  static targets = ['tab', 'panel']

  connect() {
    this.activeTabClasses = (this.data.get('activeTab') || 'active').split(' ')
    this.inactiveTabClasses = (this.data.get('inactiveTab') || 'inactive').split(' ')
    if (this.anchor) this.index = this.tabTargets.findIndex((tab) => tab.id === this.anchor)
    this.showTab(false)
  }

  showTab(update_anchor = true) {
    this.tabTargets.forEach((tab, index) => {
      const panel = this.panelTargets[index]

      if (index === this.index) {
        panel.classList.remove('hidden')
        tab.classList.remove(...this.inactiveTabClasses)
        tab.classList.add(...this.activeTabClasses)

        // Update URL with the tab ID if it has one
        // This will be automatically selected on page load
        if (tab.id  && update_anchor) {
          location.hash = tab.id
        }
      } else {
        panel.classList.add('hidden')
        tab.classList.remove(...this.activeTabClasses)
        tab.classList.add(...this.inactiveTabClasses)
      }
    })
  }
}