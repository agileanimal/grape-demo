module APIHelpers
  
  def access_denied!
    error! "Access Denied", 401
  end

  def bad_request!
    error! "Bad Request", 400
  end
  
  def forbidden_request!
    error! "Forbidden", 403
  end
  
  def not_found!
    error! "Not Found", 404
  end

  def invalid_request!(message)
    error! message, 422
  end
  
end