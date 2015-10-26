class Children::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
# before_action :set_default
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @bank = Bank.find(sign_up_params[:bank_id])
    @child = Child.new(sign_up_params)
    @parent = @bank.parent
    if @child.save
      flash[:notice] = "Child added to bank"
      redirect_to parent_bank_path(@parent, @bank)
    else
      flash[:notice] = "Something went wrong"
      redirect_to :back
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :password, :password_confirmation, :first_name, :last_name, :bank_id) }
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(child)
    "banks/#{bank.id}"
  end

  # def set_default
  #   @bank = Bank.find(params[:bank])
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
