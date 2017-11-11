module KatasHelper
  NO_LINK = ''

  def add_kata_button
    return link_to(:add_kata, new_kata_path) if admin_signed_in?

    NO_LINK
  end

  def edit_kata_button(kata)
    return link_to(:edit, edit_kata_path(kata)) if admin_signed_in?

    NO_LINK
  end

  def delete_kata_button(kata)
    return link_to(:delete, kata_path(kata), method: :delete) if admin_signed_in?

    NO_LINK
  end
end
