class Api::V1::AuthorizationController < ApplicationController

  def create
    @user = User.find_by(username: params["username"])

    if (@user && @user.authenticate(params["password"]))
      token = generate_token
      render json: {
        token: token,
        id: @user.id,
        username: @user.username
      }
    else
      render json: {
        errors: "User not found"
      }, status: :unauthorized
    end
  end
  
end
