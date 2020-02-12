class FavoritesController < ProtectedController
  before_action :set_favorite, only: [:show, :update, :destroy]

  # GET /stations
  def index
    @favorites = current_user.favorites.all

    render json: @favorites
  end

  # GET /favorites/1
  def show
    render json: @favorite
  end

  # POST /stations
  def create
    @favorite = Favorite.new(favorite_params)

    if @favorite.save
      render json: @favorite, status: :created, location: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stations/1
  def update
    if @favorite.update(favorite_params)
      render json: @favorite
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
