class ApplicationController < ActionController::API
  include Response
  rescue_from ActiveRecord::RecordNotFound do |e|
    error_message(e.message, :not_found)
  end

  rescue_from(ActionController::ParameterMissing) do |e|
    error_message(e.message, :bad_request)
  end

  private

  def error_message(message, status = :unprocessable_entity)
    error = {message: message, status: Rack::Utils::SYMBOL_TO_STATUS_CODE[status]}
    error_json_response(error, status)
  end
end
