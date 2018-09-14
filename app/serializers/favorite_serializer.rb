class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :workspace_id
  belongs_to :user
  belongs_to :workspace
end
