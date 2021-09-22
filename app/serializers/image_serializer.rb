class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :description, :tags, :title, :artist_id
end
