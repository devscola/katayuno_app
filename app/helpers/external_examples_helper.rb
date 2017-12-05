module ExternalExamplesHelper
  NO_LINK = ''

  def delete_external_example(id, kata, user)
    text = t(:delete)
    return link_to(text, delete_external_example_path(id, kata), { method: :delete, class: "btn btn-danger", data: {confirm: "Are you sure?"}}) if admin_signed_in?
    return link_to(text, delete_external_example_path(id, kata), { method: :delete, class: "btn btn-danger", data: {confirm: "Are you sure?"}}) if example_belongs?(user)

    NO_LINK
  end

  def edit_external_example(id, user)
    text = t(:edit)
    return link_to(text, edit_external_example_path(id), { class: "btn btn-info" }) if admin_signed_in?
    return link_to(text, edit_external_example_path(id), { class: "btn btn-info" }) if example_belongs?(user)

    NO_LINK
  end
end
