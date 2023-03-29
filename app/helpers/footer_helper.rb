# frozen_string_literal: true

module FooterHelper
  def current_years
    Time.now.year
  end

  def link(url, name)
    link_to name, url, target: '_blank', rel: 'nofollow noopener'
  end
end
