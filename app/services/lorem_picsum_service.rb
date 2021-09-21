class LoremPicsumService
  def self.random_picture
    response = Faraday.get("https://picsum.photos/500/600")
    response[:location]
  end
end
