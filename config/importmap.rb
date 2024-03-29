# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin_all_from 'app/javascript/custom', under: 'custom'
pin 'tailwindcss-stimulus-components', to: 'https://ga.jspm.io/npm:tailwindcss-stimulus-components@3.0.4/dist/tailwindcss-stimulus-components.modern.js'
pin '@rails/request.js', to: 'https://ga.jspm.io/npm:@rails/request.js@0.0.8/src/index.js'
