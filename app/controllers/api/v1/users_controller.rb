class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]
  before_action :is_authenticated?, except: [:create]

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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :email)
  end

end
