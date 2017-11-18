module KatasHelper
  NO_LINK = ''

  def edit_belt_button(id)
    text = t(:delete_belt)
    return link_to(text, delete_belt_path(id), method: :delete) if admin_signed_in?

    NO_LINK
  end

  def delete_belt_button(id)
    text = t(:edit_belt)
    return link_to(text, edit_belt_path(id)) if admin_signed_in?

    NO_LINK
  end

  def add_kata_button
    text = t(:add_kata)
    return link_to(text, new_kata_path) if admin_signed_in?

    NO_LINK
  end

  def edit_kata_button(kata)
    text = t(:edit)
    return link_to(text, edit_kata_path(kata)) if admin_signed_in?

    NO_LINK
  end

  def delete_kata_button(kata)
    text = t(:delete)
    return link_to(text, kata_path(kata), method: :delete) if admin_signed_in?

    NO_LINK
  end
end
