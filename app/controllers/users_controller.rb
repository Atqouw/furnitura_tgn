class UsersController < ApplicationController

  load_and_authorize_resource :user

  def update
    @user.update_attributes(user_params)
  end

  private

  def user_params
    params.fetch(:user).permit(
        :first_name, :last_name,
    )
  end

end