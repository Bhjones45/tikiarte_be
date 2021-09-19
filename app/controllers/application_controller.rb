class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: {
      errors: "Unable to find record"
    }.to_json, status: 404
  end
end
