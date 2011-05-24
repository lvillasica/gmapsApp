class User::SessionsController < Devise::SessionController
  respond_to :html
  def destroy
    super
    reset_session
  end
end
