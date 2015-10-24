class RegistrationsController < Devise::RegistrationsController
  protected
    def after_sign_up_path_for(parent)
     "/parents/#{parent.id}/banks/new"
    end
end
