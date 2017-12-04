module KatasHelper
  NO_LINK = ''

  def edit_external_kata_button(id)
    text = t(:edit)
    return link_to(text, edit_external_kata_path(id), {class: "btn btn-info"}) if admin_signed_in?

    NO_LINK
  end

  def add_external_kata_button
    text = t(:add_external_kata)
    return link_to(text, new_external_kata_path, {class: "btn btn-primary"}) if admin_signed_in?

    NO_LINK
  end

  def delete_external_kata_button(id)
    text = t(:delete)
    return link_to(text, external_kata_path(id), { method: :delete, class: "btn btn-danger"}) if admin_signed_in?

    NO_LINK
  end

  def delete_belt_button(id)
    text = t(:delete_belt)
    return link_to(text, delete_belt_path(id), { method: :delete, class: "btn btn-danger"}) if admin_signed_in?

    NO_LINK
  end

  def edit_belt_button(id)
    text = t(:edit_belt)
    return link_to(text, edit_belt_path(id), {class: "btn btn-info"}) if admin_signed_in?

    NO_LINK
  end

  def add_kata_button
    text = t(:add_kata)
    return link_to(text, new_kata_path, {class: "btn btn-primary"}) if admin_signed_in?

    NO_LINK
  end

  def edit_kata_button(kata)
    text = t(:edit)
    return link_to(text, edit_kata_path(kata), {class: "btn btn-info"}) if admin_signed_in?

    NO_LINK
  end

  def delete_kata_button(kata)
    text = t(:delete)
    return link_to(text, kata_path(kata), { method: :delete, class: "btn btn-danger"}) if admin_signed_in?

    NO_LINK
  end
end
