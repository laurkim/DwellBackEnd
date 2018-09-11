class Api::V1::FavoritesController < ApplicationController
  before_action :requires_login, only: [:create]

  def create
    user = the_current_user
    @favorite = Favorite.new(favorites_params)
    @favorite.user_id = user.id
    @favorite.save
    render json: @favorite
  end

  private

  def favorites_params
    params.require(:favorite).permit(:workspace_id)
  end
end
