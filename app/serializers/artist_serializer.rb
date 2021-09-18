class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :password, :director_id
end
