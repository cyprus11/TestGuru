module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to("https://github.com/#{author}/#{repo}", "https://github.com/#{author}/#{repo}")
  end

  def flash_messages
    flash.each do |name, text|
      next unless text.present?

      concat(content_tag(:div, text, class: "alert #{bootstrap_class_for(name)} alert-dismissible fade show", role: "alert") do
        concat content_tag(:button, '', class: "btn-close", data: { :"bs-dismiss" => "alert" }, aria: { label: "Close" })
        concat text
      end)
    end
    nil
  end

  def bootstrap_class_for(flash_type)
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
