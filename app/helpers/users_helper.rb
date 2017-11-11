module UsersHelper
  def handle_admin(user)
    return become_admin_link(user.id) unless user.admin?

    revoke_admin_link(user.id)
  end

  private

  def revoke_admin_link(id)
    link_to('Revoke Admin', revoke_admin_path(id), method: :patch)
  end

  def become_admin_link(id)
    link_to('Become Admin', become_admin_path(id), method: :patch)
  end
end
