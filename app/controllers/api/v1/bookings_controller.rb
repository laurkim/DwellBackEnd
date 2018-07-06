class Api::V1::BookingsController < ApplicationController
  before_action :requires_login, only: [:create]

  def create
    user_id = decode_token
    workspace_id = params["workspaceId"]
    byebug
  end

  private

  def booking_params
  end
end
