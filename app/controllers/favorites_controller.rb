class FavoritesController < ApplicationController
  before_action :set_station, only: [:show, :update, :destroy]

  # GET /stations
  def index
    @favorites = Favorite.all

    render json: @favorites
  end

  # GET /favorites/1
  def show
    render json: @favorites
  end

  # POST /stations
  def create
    @favorites = Favorite.new(favorite_params)

    if @favorites.save
      render json: @favorite, status: :created, location: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stations/1
  def update
    if @favorite.update(favorite_params)
      render json: @station
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stations/1
  def destroy
    @favorite.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
  def favorite_params
    params.require(:favorite).permit(:description, :user_id, :station_id)
  end
end
