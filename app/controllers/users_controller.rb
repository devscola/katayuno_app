class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def become_admin
    user = User.find(params[:id])
    user.become_admin
    user.save

    redirect_to users_path
  end

  def revoke_admin
    user = User.find(params[:id])
    user.revoke_admin
    user.save

    redirect_to users_path
  end

  def destroy
    redirect_to users_path
  end
end
