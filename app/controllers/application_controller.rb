class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    selections_path
  end
end
