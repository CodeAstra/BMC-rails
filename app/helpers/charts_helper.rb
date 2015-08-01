module ChartsHelper
  def chart_cell_content(chart, col_name)
    content_tag(:h4, col_name.to_s.titleize) +
      content_tag(:p, chart.send(col_name), class: "content") +
      link_to(fa_icon("pencil"), "#", class: "modal-trigger", data: {toggle: "modal", target: "##{col_name.to_s}-modal"})
  end
end
