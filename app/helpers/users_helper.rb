module UsersHelper
  def handle_admin(user)
    return become_admin_link(user.id) unless user.admin?

    revoke_admin_link(user.id)
  end

  private

  def revoke_admin_link(id)
    text = t(:revoke_admin)
    link_to(text, revoke_admin_path(id), method: :patch)
  end

  def become_admin_link(id)
    text = t(:become_admin)
    link_to(text, become_admin_path(id), method: :patch)
  end
end
