module UsersHelper
  def handle_admin(user)
    return link_to('Revoke Admin', revoke_admin_path(user.id), method: :patch) unless user.admin?

    link_to('Become Admin', become_admin_path(user.id), method: :patch)
  end
end
