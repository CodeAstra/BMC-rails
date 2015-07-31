$ ->
  $('.footer-dropup-trigger').click ->
    $(@.dataset.target).toggleClass('hidden')
    @.toggleClass('active')
