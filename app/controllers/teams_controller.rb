class TeamsController < ApplicationController
  before_action :get_team

  def index
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
  end

  def new
  end

  def destroy
  end

  def get_team
    @team = Team.find(params[:id])
  end
end
