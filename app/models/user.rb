class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def become_admin
    self.admin = true
  end

  def revoke_admin
    self.admin = false
  end

  def admin?
    self.admin
  end
end
