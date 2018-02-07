module ExamplesHelper
  NO_LINK = ''

  def edit_example(id)
    link = link_to(
      'mode_edit',
      edit_example_path(id),
      {class: "material-icons"}
    )

    return link if admin_signed_in?
    return link if user_owns?(id)

    NO_LINK
  end

  def delete_example(id)
    link = link_to(
      'delete',
      delete_example_path(id),
      {
        method: :delete,
        class: "material-icons",
        id: 'delete',
        data: {confirm: "Are you sure?"}
      }
    )

    return link if admin_signed_in?
    return link if user_owns?(id)

    NO_LINK
  end
end
