class Users::SessionsController < Devise::SessionsController
  def create
    super do
      flash[:notice] = "Привет, #{current_user.first_name || current_user.email}!"
    end
  end
end
