class Image < ApplicationRecord
  belongs_to :artist

  has_one_attached :upload, dependent: :destroy
  validates :upload, content_type: [:png, :jpg, :jpeg], size: {less_than: 5.megabytes}

  def upload_url
    if upload.attached?
      upload.blob.service_url
    end
  end
end
