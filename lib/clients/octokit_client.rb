class OctokitClient

  ACCESS_TOKEN = Rails.application.credentials.github[:gist_access_token]

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def response_status
    @http_client.last_response.status
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end