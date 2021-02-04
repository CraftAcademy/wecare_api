class Api::FoodbagsController < ApplicationController
  before_action :authenticate_user!, only: %i[create index]

  def create
    foodbag = current_user.foodbags.create(foodbag_params)
    if foodbag.persisted?
      render json: { message: 'Your foodbag was successfully created!' }, status: 201
    else
      render json: { message: foodbag.errors.full_messages.to_sentence }, status: 422
    end
  end

  def index
    foodbags = Foodbag.all
    render json: foodbags, each_serializer: FoodbagsIndexSerializerSerializer
  end

  private

  def foodbag_params
    params.require(:foodbag).permit(:pickuptime, :status)
  end
end
