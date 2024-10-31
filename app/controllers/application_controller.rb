class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization

  before_action :authenticate_user!,unless: :devise_controller?

  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

  private

  def handle_record_invalid(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end
end
