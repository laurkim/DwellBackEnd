class WorkspaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :yelp_url, :rating, :address_one, :address_two, :city, :zip_code, :latitude, :longitude, :phone
end
