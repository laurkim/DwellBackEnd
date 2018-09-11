class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if (@user.save)
      token = generate_token
      render json: {
        token: token,
        user: JSON.parse(UserSerializer.new(@user).to_json)
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def show
    # Retrieve token from Headers in Post request to find current user based...
    # ...on token currently in localStorage
    token = request.headers["Authorization"].split(" ")[1]
    decoded_token = JWT.decode(token, ENV["SECRET_PHRASE"], true, { algorithm: ENV["SECRET_KEY"]})
    user_id = decoded_token[0]["id"]
    user = User.find_by(id: user_id)
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :email)
  end

end
