RSpec.feature 'User Authentication' do
  context 'Sign Up' do
    scenario 'A user can signup' do
      visit '/'
      click_on 'Sign up'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign up'

      expect(page).to have_content 'Welcome, test@test.com'
    end
  end

  context 'Sign in/out' do
    let!(:user) { User.create(email: 'test@test.com', password: 'secret123') }

    scenario 'A user can signin' do
      visit '/'
      click_on 'Sign in'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign in'

      expect(page).to have_content 'Welcome, test@test.com'
    end

    scenario 'A signed in user can log out' do
      visit '/signin'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign in'
      click_button 'Log out'

      expect(page.current_path).to eq '/'
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'Sign in'
    end
  end

  context 'Welcome page' do
    scenario 'A user has two options, to either book or list' do
      visit '/'
      click_on 'Sign up'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign up'

      expect(page).to have_button 'Book'
      expect(page).to have_button 'List'
    end
  end

  context 'List page' do
    scenario 'A user can access add property page' do
      visit '/'
      click_on 'Sign up'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign up'
      click_button 'List'
      expect(page.current_path).to eq '/list'
      expect(page).to have_content 'Add property'
    end
    scenario 'A user can access add property page' do
      visit '/'
      click_on 'Sign up'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'secret123'
      click_button 'Sign up'
      click_button 'List'
      fill_in :name, with: 'Oak tavern'
      fill_in :address, with: '1 Oak tavern Street'
      fill_in :ppn, with: '20'
      fill_in :description, with: 'Best flat/tavern for getting pissed'
      click_button 'Add'
      expect(page.current_path).to eq '/profile'
      expect(page).to have_content 'Oak tavern'
      expect(page).to have_content '1 Oak tavern Street'
      expect(page).to have_content 20
      expect(page).to have_content 'Best flat/tavern for getting pissed'
    end
  end
end
