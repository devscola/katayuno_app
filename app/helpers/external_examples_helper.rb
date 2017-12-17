module ExternalExamplesHelper
  NO_LINK = ''

  def delete_external_example(id, kata, user)
    text = 'delete'
    return link_to(text, delete_external_example_path(id, kata), { method: :delete, class: "material-icons", id: 'delete', data: {confirm: "Are you sure?"}}) if admin_signed_in?
    return link_to(text, delete_external_example_path(id, kata), { method: :delete, class: "material-icons", id: 'delete', data: {confirm: "Are you sure?"}}) if example_belongs?(user)

    NO_LINK
  end

  def edit_external_example(id, user)
    text = 'mode_edit'
    return link_to(text, edit_external_example_path(id), { class: "material-icons" }) if admin_signed_in?
    return link_to(text, edit_external_example_path(id), { class: "material-icons" }) if example_belongs?(user)

    NO_LINK
  end
end
