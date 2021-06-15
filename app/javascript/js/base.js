// base dependency library - ES6
import 'core-js/stable'
import 'regenerator-runtime/runtime'

// base dependency library - jQuery & Bootstrap
import $ from 'jquery'
import 'bootstrap/dist/js/bootstrap'

// base dependency library - Rails, misc
import * as Sentry from "@sentry/browser";
import ClipboardJS from 'clipboard'
import RailsUjs from '@rails/ujs'
import Turbolinks from 'turbolinks'
import 'channels'

const images = require.context('images', true)
const imagePath = (name) => images(name, true)

$(document).on('turbolinks:load', function () {
  if (typeof gon !== 'undefined' && gon.user_id) {
    Sentry.setUser({
      user_id: gon.user_id
    });
  }
})

// Start RailsUjs & Turbolinks
RailsUjs.start()
Turbolinks.start()

// Turbolinks: https://github.com/turbolinks/turbolinks/issues/329
Turbolinks.reload = function () {
  Turbolinks.visit(window.location.href)
}

// Turbolinks: https://github.com/turbolinks/turbolinks/issues/146
let dispatchUnloadEvent = function () {
  let event = document.createEvent('Events')
  event.initEvent('turbolinks:unload', true, false)
  document.dispatchEvent(event)
}
addEventListener('beforeunload', dispatchUnloadEvent)
addEventListener('turbolinks:before-render', dispatchUnloadEvent)

// Bootstrap
$(document).on('turbolinks:load', function () {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()

  $('.btn-clipboard[data-clipboard-text]').each(function () {
    let copyBtn = $(this)
    let clipboard = new ClipboardJS(copyBtn[0])
    clipboard.on('success', function () {
      copyBtn.tooltip({ title: '已复制', trigger: 'manual' }).tooltip('show')
      copyBtn.unbind().mouseleave(function () {
        setTimeout(function () {
          copyBtn.tooltip('hide')
        }, 1000)
      })
    })
  })
})
