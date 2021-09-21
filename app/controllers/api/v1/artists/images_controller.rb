class Api::V1::Artists::ImagesController < ApplicationController
  def create
    upload = params[:image]
    params = image_params.except(:image)
    image = Image.create!(params)
    image.upload.attach(upload) if upload.present? && !!image
    render json: image.as_json(root: false, methods: :upload_url)
  end

  private
  def image_params
    params.permit(:description, :title, :tags, :status, :image).merge(artist_id: params[:artist_id])
  end
end
