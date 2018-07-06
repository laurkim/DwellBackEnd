class Api::V1::WorkspacesController < ApplicationController
  before_action :requires_login, only: [:index]

  def index
    @workspaces = Workspace.all
    render json: @workspaces
  end

end
