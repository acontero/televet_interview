class PetsController < ApplicationController
  def index
    @pets = Pet.order(:id).page(params[:page]).pluck(:id, :name, :weight, :age)

    #NOTE: This is following the format seen in the pets.json file sent to me for this interview. Otherwise I would use a serializer to format this data and the keys would match the column names, as indicated in the instructions. (See routes commented out further below in this file.)
    render json: {
      cols: [
    		"id",
    		"name",
    		"weight",
    		"age"
    	],
    	"data": @pets
    }
  end

  #NOTE: I assumed this format could be standard json object since no json template was given for a single object
  def show
    @pet = Pet.find_by(id: params[:id])
    if @pet
      render json: @pet.as_json.except("given_id").to_json
    else
      render json: {
        error_message: "No pet with that id was found."
      },
      status: 404
    end
  end

  #TO DO:
  #add pagination
  #caching
  #tests

  # ALTERNATE ROUTES WITH ALT JSON FORMATS FOR PAYLOADS
  # def index
  #   @pets = Pet.order(:id).page(params[:page])
  #   render json: V1::PetsSerializer.new(
  #       @pets
  #     )
  # end
  #
  # def show
  #   @pet = Pet.find_by(id: params[:id])
  #   if @pet
  #     render json: V1::PetSerializer.new(
  #       @pet
  #     )
  #   else
  #     render json: {}, status: 404
  #   end
  # end
end
