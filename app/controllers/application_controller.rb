class ApplicationController < ActionController::Base

  protected

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
