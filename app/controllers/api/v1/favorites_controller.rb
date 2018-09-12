class Api::V1::FavoritesController < ApplicationController
  before_action :requires_login, only: [:create, :destroy]

  def create
    user = the_current_user
    @favorite = Favorite.new(favorites_params)
    @favorite.user_id = user.id
    @favorite.save
    render json: @favorite
  end

  def destroy
    favorite_id = params["id"].to_i
    Favorite.delete(favorite_id)
    render json: {message: "Successfully removed!"}
  end

  private

  def favorites_params
    params.require(:favorite).permit(:workspace_id)
  end
end
