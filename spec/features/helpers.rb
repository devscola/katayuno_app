
def log_in_user(email='user@test.com', password='12345678')
  user = create_user
  visit new_user_session_path
  fill_in(:user_email, with: user.email)
  fill_in(:user_password, with: user.password)
  find('input[name="commit"]').click
  user
end

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
  user
end

def create_user(email='user@test.com', password='12345678')
  user = User.new(
    email: email,
    password: password,
    password_confirmation: password
  )
  user.save
  user
end

def create_kata(title='Kata title', description='Kata description')
  kata = Kata.new(
    title: title,
    description: description
  )
  kata.save
  kata
end
