module ExamplesHelper
  NO_LINK = ''

  def edit_example(example_id, user_id)
    return link_to('mode_edit', edit_example_path(example_id), {class: "material-icons"}) if admin_signed_in?
    return link_to('mode_edit', edit_example_path(example_id), {class: "material-icons"}) if example_belongs?(user_id)

    NO_LINK
  end

  def delete_example(example_id, user_id)
    return link_to('delete', delete_example_path(example_id), { method: :delete, class: "material-icons", id: 'delete', data: {confirm: "Are you sure?"}}) if admin_signed_in?
    return link_to('delete', delete_example_path(example_id), { method: :delete, class: "material-icons", id: 'delete', data: {confirm: "Are you sure?"}}) if example_belongs?(user_id)

    NO_LINK
  end
end
