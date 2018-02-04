class UsersController < ApplicationController
  before_action :set_user, only: [:become_admin, :revoke_admin, :destroy]

  def index
    @users = User.all
  end

  def become_admin
    @user.become_admin
    @user.save

    redirect_to users_path
  end

  def revoke_admin
    @user.revoke_admin
    @user.save

    redirect_to users_path
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
