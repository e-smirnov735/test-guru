module SessionsHelper
  def flash_alert(alert)
    return unless flash[alert]

    content_tag :p, flash[alert], class: 'flash alert'
  end
end
