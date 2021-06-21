# frozen_string_literal: true

require_relative '../../services/companies_house'
require_relative '../authenticated_controller'

module Integrations
  # This controller is responsible for communicating with the
  # Companies House API to fetch details about a company.
  class CompaniesHouseController < AuthenticatedController
    before_action :set_team, :set_connection

    def company_profile
      return head(:forbidden) if @connection.nil?

      @companies_house = CompaniesHouse.new

      render json: @companies_house.get_company_profile(
        @connection.connection_details,
        params.require(:company_number)
      )
    end

    private

    def set_team
      @team = Team.find params[:team_id]
    end

    def set_connection
      @connection = @team.team_connections.where(name: 'companies_house').first
    end
  end
end
