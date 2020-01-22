class PetsController < ApplicationController

  def index
    object = Pet.select(:id,:name,:weight,:age).order(:id).page(params[:page])
    render json: ListSerializers::Pets.new(object).as_json
  end

  #NOTE: I assumed this format could be standard json object since no json template was given for a single object
  def show
    @pet = Pet.find_by(id: params[:id])
    if @pet
      render json: @pet
    else
      render json: {}, status: 404
    end
  end






  # ALTERNATE ROUTES WITH ALT JSON FORMATS FOR PAYLOADS
  #NOTE: This is following the format seen in the pets.json file sent to me for this interview. Otherwise I would use a serializer to format this data and the keys would match the column names, as indicated in the instructions. (See routes commented out further below in this file.)
  # def index
  #   @pets = Pet.order(:id).page(params[:page]).pluck(:id, :name, :weight, :age)
  #
  #   render json: {
  #     cols: [
  #   		"id",
  #   		"name",
  #   		"weight",
  #   		"age"
  #   	],
  #   	"pets": @pets
  #   }
  # end
end
