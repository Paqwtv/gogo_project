# redirect to edit profile after sign up
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    edit_profile_path(current_user.id) || super
  end
end
