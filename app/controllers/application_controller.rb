class ApplicationController < ActionController::API
  def generate_token
    payload = {
      id: @user.id
    }
    JWT.encode(payload, ENV['SECRET_PHRASE'], ENV['SECRET_KEY'])
  end

  def get_token
    request.headers["Authorization"]
  end

  def decode_token
    token = get_token
    begin
      decoded_token = JWT.decode(token, ENV['SECRET_PHRASE'], true, { algorithm: ENV['SECRET_KEY'] })
    rescue JWT::DecodeError
      return nil
    end

    decoded_token
  end

  def is_authenticated?
    !!decode_token
  end

  def requires_login
    if !is_authenticated?
      render json: {
        message: "Login Failed"
      }, status: :unauthorized
    end
  end

  def requires_user_match
    @user = User.find_by(id: params[:user_id])
    if @user.id != decode_token[0]["id"]
      render json: {
        message: "User Does Not Match"
      }, status: :unauthorized
    end
  end

end
