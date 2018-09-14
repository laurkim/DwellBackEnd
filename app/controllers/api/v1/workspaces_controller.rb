class Api::V1::WorkspacesController < ApplicationController
  def index
    @workspaces = Workspace.all
    render json: @workspaces
  end
end
