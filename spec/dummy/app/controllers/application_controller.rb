class ApplicationController < ActionController::Base
  protect_from_forgery

  def name
    render text: Merlin.dummy.name
  end
end
