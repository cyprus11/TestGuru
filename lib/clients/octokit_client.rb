class OctokitClient < GitHubClient

  def initialize
    super
  end

  def create_gist(params)
    @result = @http_client.create_gist(params)
    self
  end

  def success?
    html_url.present?
  end

  def html_url
    @result['html_url']
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end