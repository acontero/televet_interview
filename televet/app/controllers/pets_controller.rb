class PetsController < ApplicationController
  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet.to_json
  end

  #TO DO:
  #include error handling
  #add pagination
end
