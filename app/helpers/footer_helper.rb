# frozen_string_literal: true

module FooterHelper
  def current_years
    Time.current.year
  end

  def link(url, name)
    link_to name, url, target: '_blank', rel: 'nofollow noopener'
  end

  def github_url(author, repo)
    ["https://github.com", author, repo].join('/')
  end
end
