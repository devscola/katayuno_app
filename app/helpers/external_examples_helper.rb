module ExternalExamplesHelper
  NO_LINK = ''

  def delete_external_example(id, kata, user)
    text = t(:delete)
    return link_to(text, delete_external_example_path(id, kata), { method: :delete, class: "btn btn-danger"}) if admin_signed_in?
    return link_to(text, delete_external_example_path(id, kata), { method: :delete, class: "btn btn-danger"}) if example_belongs?(user)

    NO_LINK
  end

  def edit_external_example(id)
    text = t(:edit)
    link_to(text, edit_external_example_path(id), { class: "btn btn-info" })
  end
end
