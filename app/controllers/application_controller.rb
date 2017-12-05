class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
  # Here you can write logic based on roles to return different after sign in paths
  if current_user.admin?
    rails_admin_path
  elsif current_user.author?
    papers_path
  elsif current_user.pcc?
    pcc_index_path
  elsif current_user.pcm?
    '/pcm_controller/index'
  else
    new_user_path
  end
end
end
