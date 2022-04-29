class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_adverts_path
    else
      adverts_path
    end
  end
end
