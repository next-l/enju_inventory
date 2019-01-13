class ApplicationController < ActionController::Base
  protect_from_forgery

  include EnjuBiblio::Controller
  include EnjuLibrary::Controller
  include EnjuInventory::Controller
  after_action :verify_authorized
  before_action :set_paper_trail_whodunnit

  include Pundit
end
