class DirectorArtistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :token, :google_id, :artists
end
