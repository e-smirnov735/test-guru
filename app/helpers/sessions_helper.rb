module SessionsHelper
  def flash_message(msg, type)
    flash_class = "alert "

    flash_class += type == 'alert' ? 'alert-danger' : 'alert-info'

    content_tag :p, msg, class: flash_class
  end
end
