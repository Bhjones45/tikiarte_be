class ArtistImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :images
end
