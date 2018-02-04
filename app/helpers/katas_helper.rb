module KatasHelper
  NO_LINK = ''

  def delete_belt_button(id)
    text = 'delete'
    return link_to(text, delete_belt_path(id), { method: :delete, class: "material-icons", id: 'delete', data: {confirm: "Are you sure?"}}) if admin_signed_in?

    NO_LINK
  end

  def edit_belt_button(id)
    text = 'mode_edit'
    return link_to(text, edit_belt_path(id), {class: "material-icons"}) if admin_signed_in?

    NO_LINK
  end

  def add_kata_button
    text = t(:add_kata)
    return link_to(text, new_kata_path, {class: "btn btn-primary"}) if admin_signed_in?

    NO_LINK
  end

  def edit_kata_button(kata)
    text = 'mode_edit'
    return link_to(text, edit_kata_path(kata), {class: "material-icons"}) if admin_signed_in?

    NO_LINK
  end

  def delete_kata_button(kata)
    text = 'delete'
    return link_to(text, kata_path(kata), { method: :delete, class: "material-icons", id: 'delete', data: {confirm: "Are you sure?"}}) if admin_signed_in?

    NO_LINK
  end
end
