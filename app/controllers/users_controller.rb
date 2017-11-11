class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def become_admin
  end

  def revoke_admin
  end

  def destroy
  end
end
