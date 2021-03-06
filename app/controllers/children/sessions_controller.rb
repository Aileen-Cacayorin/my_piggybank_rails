class Children::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :password) }
  end

  def after_sign_in_path_for(child)
    "/banks/#{child.bank.id}/children/#{child.id}"
  end
end
