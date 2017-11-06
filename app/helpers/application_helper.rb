module ApplicationHelper
  def session_actions
    return log_out_link if user_signed_in?

    log_in_link
  end

  def logged_user
    current_user.email if user_signed_in?
  end

  private

  def log_out_link
    text = t(:log_out)
    link_to(text, destroy_user_session_path, method: :delete)
  end

  def log_in_link
    text = t(:log_in)
    link_to(text, new_user_session_path)
  end
end
