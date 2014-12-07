class Api::PokemonController < ApplicationController
  def show
      if params[:id]
          if params[:id] == "random"
              @pokemon = Pokemon.all.sample(1)[0]
              
          else
              @pokemon = Pokemon.find(params[:id])
          end
         render json: @pokemon
      end
  end
  
  def random_ou
      pokes = Format.most_valuables.map {|format| format.pokemons }.flatten
      @pokemon = pokes.sample
      render json: @pokemon
  end
  
  def random_move
      
  end

  def find
  end

  def index
  end
end
