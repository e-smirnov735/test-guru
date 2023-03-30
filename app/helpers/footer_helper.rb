# frozen_string_literal: true

module FooterHelper
  def current_years
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}",
            target: '_blank',
            rel: "nofollow noopener"
  end
end
