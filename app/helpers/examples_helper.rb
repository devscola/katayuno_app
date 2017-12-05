module ExamplesHelper
  NO_LINK = ''

  def edit_example(example_id, user_id)
    return link_to(t(:edit_example), edit_example_path(example_id), {class: "btn btn-info"}) if admin_signed_in?
    return link_to(t(:edit_example), edit_example_path(example_id), {class: "btn btn-info"}) if example_belongs?(user_id)

    NO_LINK
  end

  def delete_example(example_id, user_id)
    return link_to(t(:delete_example), delete_example_path(example_id), { method: :delete, class: "btn btn-danger"}) if admin_signed_in?
    return link_to(t(:delete_example), delete_example_path(example_id), { method: :delete, class: "btn btn-danger"}) if example_belongs?(user_id)

    NO_LINK
  end
end
