module ChartsHelper
  def chart_cell_content(chart, chart_version, col_name)
    content_tag(:h4, col_name.to_s.titleize) +
      content_tag(:div, class: "content") do
        raw (chart_version || chart).send(col_name)
      end +
      (chart_version ? link_to(fa_icon("pencil"), "#", class: "modal-trigger", data: {toggle: "modal", target: "##{col_name.to_s}-modal"}) : "")
  end
end
