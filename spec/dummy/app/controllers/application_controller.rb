class ApplicationController < ActionController::Base
  protect_from_forgery

  def name
    render text: $merlin.dummy.name
  end
end
