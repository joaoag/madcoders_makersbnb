def sign_up
  visit '/'
  click_on 'Sign up'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'secret123'
  click_button 'Sign up'
end

def sign_in
  visit '/'
  click_on 'Sign in'
  fill_in :email, with: 'test@test.com'
  fill_in :password, with: 'secret123'
  click_button 'Sign in'
end