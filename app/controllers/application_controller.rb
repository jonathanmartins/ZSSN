class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def percentage(part, whole)
    return ((part.to_f / whole.to_f) * 100)
  end
end
