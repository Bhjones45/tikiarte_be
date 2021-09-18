Director.destroy_all

jacob = Director.create(
  email: "jacobmarcareer@gmail.com",
  token: 66666,
  google_id: 12345
)

jacob.artists.create(
  username: "satan",
  password: "12345"
)

jacob.artists.create(
  username: "medusa",
  password: "xenasux"
)

jacob.artists.create(
  username: "xena",
  password: "imdabes"
)
