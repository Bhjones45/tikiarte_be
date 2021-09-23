class ArtistImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :images

  attributes :images do |artist|
    artist.images.sorted
  end
end
