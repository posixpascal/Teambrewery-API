class Api::TeamController < Api::ApiController

  
  def show
    team = ApplicationController::Team.find(params[:id].to_i)
    return render :json => team
  end

  def index
  end

  # list your teams
  def list
    page = params[:page] || 2
    if current_user
      render :json => current_user.teams.page(page)
    end

  end

  def create
    team = ApplicationController::Team.new
    team.name = params[:name]
    team.user = current_user
    team.format = ApplicationController::Format.find_by_name(params[:tier])
    team.populate_on_creation = params[:populate]
    team.private = params[:private]
    team.save()
    render :json => team
  end

  def update
    team = ApplicationController::Team.find(params[:id].to_i)
    if current_user != team.user
      return render :json => {success: false}
    end
    team.pokemons = []
    if params[:pokemons].is_a? Array
      params[:pokemons].first(6).each do |p|
        begin
          team.pokemons << ApplicationController::Pokemon.find(p[:id].to_i)
        rescue
        end
      end
    end
   # team.pokemons = pokes
    team.name = params[:name]
    team.private = !!params[:private]
    team.format = ApplicationController::Format.find_by_name(params[:tier])
    team.save()
    return render :json => team
  end

  def delete
  end

  def new
  end
end
