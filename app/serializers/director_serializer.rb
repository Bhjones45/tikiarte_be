class DirectorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :token, :google_id
end
