module SessionsHelper
  def flash_message_helper
    flash.map do |key, value|
      content_tag :p, value, class: "flash #{key}"
    end.join.html_safe
  end
end
