$ ->
  $('#charts .front.new_chart').click ->
    $('.new_chart_container').addClass('hover')

  $('#charts .back.new_chart form a.cancel').click (ev) ->
    ev.preventDefault()
    $('.new_chart_container').removeClass('hover')
    false

  $('#charts .flip-container.chart-slide').click ->
    $(@.dataset.target)[0].click()

  $(".best_in_place").best_in_place()