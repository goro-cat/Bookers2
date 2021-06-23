class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :index]

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  Refile.secret_key = 'b4c30ba964dc1e425d7ab3fbf0f1c4208d2b31c3b428bea29e72eae6477d31c8e8e215f0fcbf6520639a8063dc95767a981807bf9b543de317d17947757e45ef'

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:log_in, keys: [:name])
  end


end
