class Api::V1::Artists::ImagesController < ApplicationController
  def create
    upload = params[:image]
    params = image_params.except(:image)
    image = Image.create!(params)
    image.upload.attach(upload) if upload.present? && !!image
    render json: image.as_json(root: false, methods: :upload_url)
  end

  def update
    image = Image.find(update_params[:id])
    image.update(update_params)
    render json: ImageSerializer.new(image)
  end

  def delete
    image = Image.find(image_id[:id])
    image.delete
  end

  def index
    artist = Artist.find(artist_id[:artist_id])
    render json: ArtistImageSerializer.new(artist)
  end

  private

  def image_params
    params.permit(:description, :title, :tags, :status, :image).merge(artist_id: params[:artist_id])
  end

  def update_params
    params.require(:image).permit(:status, :tags, :description, :title).merge(id: params[:id])
  end

  def image_id
    params.permit(:id)
  end

  def artist_id
    params.permit(:artist_id)
  end
end
