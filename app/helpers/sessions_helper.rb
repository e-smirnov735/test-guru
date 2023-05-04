module SessionsHelper
  def flash_message(msg, type)
    return unless flash[msg]

    content_tag :p, flash[msg], class: "flash #{type}"
  end
end
