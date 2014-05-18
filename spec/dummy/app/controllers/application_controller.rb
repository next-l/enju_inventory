class ApplicationController < ActionController::Base
  protect_from_forgery

  enju_leaf
  enju_library

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :render_403
end
