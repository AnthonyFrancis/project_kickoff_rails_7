class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery
before_action :configure_permitted_parameters, if: :devise_controller?

# def redirect_to_subdomain # redirects to subdomain on signup
#     return if self.is_a?(DeviseController)
#     if current_user.present? && request.subdomain != current_user.subdomain
#         redirect_to workouts_url(subdomain: current_user.subdomain)
#     end
# end

# def after_sign_in_path_for(resource)
#     root_path
# end

protected

    def configure_permitted_parameters
    	added_attrs = [:username, :first_name, :last_name, :profile_image] # this can grow to however many fields you need
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :accept_invitation, keys: [:email, :first_name, :last_name, :stripe_id, :card_brand, :card_last4, :card_exp_month, :card_exp_year]
    end
end