# frozen_string_literal: true

require 'http/http_with_api_key'

# This class interacts with Companies House to fetch info about a company.
class CompaniesHouse < HttpWithApiKey
  def initialize
    @paths = {
      officers: '/company/{company_number}/officers',
      profile: '/company/{company_number}',
      search_companies: '/search/companies'
    }

    super 'https://api.company-information.service.gov.uk'
  end

  def get_company_profile(api_key, company_number)
    get_json_response api_key, @paths[:profile], company_number: company_number
  end

  def get_company_officers(api_key, company_number)
    get_json_response api_key, @paths[:officers], company_number: company_number
  end

  def search_companies(api_key, search_text, items = 10, start = 0)
    get_json_response api_key, @paths[:search_companies], nil, {
      q: search_text,
      items_per_page: items,
      start_index: start
    }
  end
end
