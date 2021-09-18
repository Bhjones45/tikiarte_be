class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :password_digest, :director_id
end
