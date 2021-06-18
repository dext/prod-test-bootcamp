# frozen_string_literal: true

# This class interacts with Companies House to fetch info about a company.
class CompaniesHouse
  def initialize
    super

    @base_url = 'https://api.company-information.service.gov.uk'
    @officers_uri = '/company/{company_number}/officers'
    @profile_uri = '/company/{company_number}'
    @search_companies_uri = '/search/companies'
  end

  def get_company_profile(api_key, company_number)
    get_json_response api_key, @profile_uri, company_number: company_number
  end

  def get_company_officers(api_key, company_number)
    get_json_response api_key, @officers_uri, company_number: company_number
  end

  def search_companies(api_key, search_text, items = 10, start = 0)
    get_json_response api_key, @search_companies_uri, nil, {
      q: search_text,
      items_per_page: items,
      start_index: start
    }
  end

  private

  def get_json_response(api_key, uri, replacements = nil, params = nil)
    replacements&.each do |search, replace|
      uri = uri.sub "{#{search}}", replace
    end

    response = HTTP
               .basic_auth(user: api_key, pass: '')
               .get(@base_url + uri, params: params)

    JSON.parse(response.body) if response.status.success?
  end
end
