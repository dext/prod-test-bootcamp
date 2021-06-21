# frozen_string_literal: true

require_relative '../../services/companies_house'
require_relative '../authenticated_controller'

module Integrations
  # This controller is responsible for communicating with the
  # Companies House API to fetch details about a company.
  class CompaniesHouseController < AuthenticatedController
    before_action :set_team

    def company_profile
      @companies_house = CompaniesHouse.new

      render json: @companies_house.get_company_profile(
        @connection.connection_details,
        params[:company_number]
      )
    end

    private

    def set_team
      @team = Team.find params[:team_id]
      @connection = @team.team_connections.where(:name, 'companies_house').first

      if @connection.nil?
        head :forbidden

        render json: {
          message: 'Forbidden'
        }
      end
    end
  end
end
