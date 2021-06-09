class ClientsController < AuthenticatedController
  before_action :set_team

  def index
    @clients = @team.clients
  end

  def new
    @client = Client.new
  end

  def show
    @client = Client.find params[:id]
  end

  def create
    @client = Client.new client_params
    @client.user_id = current_user.id

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def delete
  end

  private

  def set_team
    @team = Team.find params[:team_id]
  end

  def client_params
    params.require(:client).permit(:name, :provider, :business_type)
  end
end
