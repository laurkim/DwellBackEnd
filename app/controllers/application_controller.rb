class ApplicationController < ActionController::API

  def generate_token
    payload = {
      id: @user.id
    }
    token = JWT.encode(payload, ENV["SECRET_PHRASE"], ENV["SECRET_KEY"])
    token
  end

  def get_token
    request.headers["Authorization"].split(" ")[1]
  end

  def decode_token
    token = get_token
    begin
      decoded_token = JWT.decode(token, ENV["SECRET_PHRASE"], true, { algorithm: ENV["SECRET_KEY"]})
      my_user = decoded_token[0]["id"]
    rescue JWT::DecodeError
      return nil
    end
    my_user
  end

  def is_authenticated?
    !!decode_token
  end

  def requires_login
    if !is_authenticated?
      render json: {
        message: "You Must Be Logged In"
      }, status: :unauthorized
    end
  end

  def requires_user_match
    @user = User.find_by(id: params[:user_id])
    if @user.id != decode_token[0]["id"]
      render json: {
        message: "User Unauthorized"
      }, status: :unauthorized
    end
  end

  def the_current_user
    user_id = decode_token
    @the_current_user = User.find_by(id: user_id)
  end
end
