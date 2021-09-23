class PublicGallerySerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :tags, :title, :description, :artist_id, :upload_url
end
