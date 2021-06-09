class ClientsController < AuthenticatedController
  def index
    @team = Team.find params[:team_id]
    @clients = @team.clients
  end

  def new
    @team = Team.find params[:team_id]
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
  end

  def create
    @team = Team.find params[:team_id]
    @client = Client.new client_params
    @client.user_id = current_user.id

    if @client.save
      format.html { redirect_to @client, notice: 'Client was successfully created.' }
    else
      render :new
    end
  end

  def edit
  end

  def delete
  end

  private

  def client_params
    params.require(:client).permit(:name, :provider, :business_type)
  end
end
