class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in?
    identity_signed_in?
  end

  def current_user
    if signed_in?
      current_identity.user
    else
      User.new
    end
  end
end
