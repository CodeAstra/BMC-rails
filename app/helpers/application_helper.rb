module ApplicationHelper
  def flash_tag(msg, msg_type)
    return unless msg.present?
    if msg_type == "notice"
      msg_type = "info"
    elsif msg_type == "alert"
      msg_type = "danger"
    end

    alert_msg(msg, msg_type)
  end

  def alert_msg(msg, msg_type)
    content_tag(:div, class: "alert alert-#{msg_type} alert-dismissible", role: "alert") do
      button_tag(class: "close", "data-dismiss" => "alert") do 
        content_tag(:span, raw("&times;"), "aria-hidden" => true) +
          content_tag(:span, "Close", class: "sr-only")
      end + msg
    end
  end
end
