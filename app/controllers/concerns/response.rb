module Response
  def json_response(object, status = :ok)
    render json: { data: object }, status: status
  end

  def error_json_response(error, status = :ok)
    render json: {error: error}, status: status
  end
end
