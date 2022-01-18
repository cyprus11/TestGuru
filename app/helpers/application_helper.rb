module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to("https://github.com/#{author}/#{repo}", "https://github.com/#{author}/#{repo}")
  end

  def flash_messages
    flash.each do |name, text|
      concat(content_tag :p, text, class: "flash #{name}") if text.present?
    end
    nil
  end
end
