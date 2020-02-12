class PredictionsController < ProtectedController

  # GET /predictions?id
  def index
    if params[:id]
      @favorite = Favorite.find(params[:id])
      json = JSON.parse(MBTAService.get_predictions(@favorite))
      puts "json: #{json}"
      render json: json, status: :ok
    else
      render json: { 'error' => 'did not find an id passed in.' }
    end
  end
end