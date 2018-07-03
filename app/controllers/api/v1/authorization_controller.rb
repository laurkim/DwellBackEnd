class Api::V1::AuthorizationController < ApplicationController

  def create
    @user = User.find_by(username: params["username"])
    if (@user && @user.authenticate(params["password"]))
      token = generate_token
      render json: {
        token: token,
        username: @user.username
      }
    else
      render json: {
        errors: "User Not Found"
      }, status: :unauthorized
    end
  end

end
