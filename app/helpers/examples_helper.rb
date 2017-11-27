module ExamplesHelper
  NO_LINK = ''

  def edit_example(example_id, user_id)
    return link_to(t(:edit_example), edit_example_path(example_id)) if admin_signed_in?
    return link_to(t(:edit_example), edit_example_path(example_id)) if example_belongs?(user_id)

    NO_LINK
  end

  def delete_example(example_id, user_id)
    return link_to(t(:delete_example), delete_example_path(example_id), method: :delete) if admin_signed_in?
    return link_to(t(:delete_example), delete_example_path(example_id), method: :delete) if example_belongs?(user_id)

    NO_LINK
  end

  private

  def example_belongs?(user_id)
    return false unless current_user

    current_user.id == user_id
  end
end
