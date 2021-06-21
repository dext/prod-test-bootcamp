# frozen_string_literal: true

# A base HTTP module to get a JSON response
class HttpWithApiKey
  def initialize(base_url)
    @base_url = base_url
  end

  private

  def get_json_response(api_key, uri, uri_replacements = nil, params = nil)
    uri_replacements&.each do |search, replace|
      uri = uri.sub "{#{search}}", replace
    end

    response = HTTP
               .basic_auth(user: api_key, pass: '')
               .get(@base_url + uri, params: params)

    JSON.parse(response.body) if response.status.success?
  end
end
