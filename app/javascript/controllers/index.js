// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import { Tabs, Modal, Dropdown } from "tailwindcss-stimulus-components"
import Flood from "./flood_controller"

eagerLoadControllersFrom("controllers", application)
application.register('tabs', Tabs)
application.register('modal', Modal)
application.register('dropdown', Dropdown)
application.register('flood', Flood)
// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

