
def log_in_admin
  user = User.new(
    email: 'admin@test.com',
    password: '12345678',
    password_confirmation: '12345678'
  )
  user.become_admin
  user.save
  visit new_user_session_path
  fill_in(:user_email, with: user.email)
  fill_in(:user_password, with: user.password)
  find('input[name="commit"]').click
end

def create_user
  user = User.new(
    email: 'user@test.com',
    password: '12345678',
    password_confirmation: '12345678'
  )
  user.save
  user
end
