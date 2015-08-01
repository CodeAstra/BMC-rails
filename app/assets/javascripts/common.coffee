$ ->
  $('.header-dropdown-trigger').click ->
    $(@.dataset.target).toggleClass('hidden')
    $(@).toggleClass('active')
