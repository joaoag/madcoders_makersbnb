require_relative './web_helpers'

RSpec.feature 'User Authentication' do
  context 'Sign Up' do
    scenario 'A user can signup' do
      sign_up
      expect(page).to have_content 'Welcome, test@test.com'
    end
  end

  context 'Sign in/out' do
    let!(:user) { User.create(email: 'test@test.com', password: 'secret123') }

    scenario 'A user can signin' do
      sign_in
      expect(page).to have_content 'Welcome, test@test.com'
    end

    scenario 'A signed in user can log out' do
      sign_in
      click_button 'Log out'

      expect(page.current_path).to eq '/'
      expect(page).to have_content 'Sign up'
      expect(page).to have_content 'Sign in'
    end
  end

  context 'Welcome page' do
    scenario 'A user has two options, to either book or list' do
      sign_up
      expect(page).to have_button 'Book'
      expect(page).to have_button 'List'
    end
  end

  context 'List page' do
    scenario 'A user can access add property page' do
      sign_up
      click_button 'List'
      expect(page.current_path).to eq '/list'
      expect(page).to have_content 'Add property'
    end
    scenario 'A user can access add property page' do
      sign_up
      click_button 'List'
      fill_in :name, with: 'Oak tavern'
      fill_in :address, with: '1 Oak tavern Street'
      fill_in :ppn, with: '20'
      fill_in :description, with: 'Best flat/tavern for getting pissed'
      fill_in :start_date, with: '01/03/2019'
      fill_in :end_date, with: '23/03/2019'
      click_button 'Add'
      expect(page.current_path).to eq '/profile'
      expect(page).to have_content 'Oak tavern'
      expect(page).to have_content '1 Oak tavern Street'
      expect(page).to have_content 20
      expect(page).to have_content 'Best flat/tavern for getting pissed'
    end
  end
  context 'Book page (view available venues)' do
    before do
      sign_up
      click_button 'List'
      fill_in :name, with: 'Oak tavern'
      fill_in :address, with: '1 Oak tavern Street'
      fill_in :ppn, with: '20'
      fill_in :description, with: 'Best flat/tavern for getting pissed'
      fill_in :start_date, with: '01/03/2019'
      fill_in :end_date, with: '23/03/2019'
      click_button 'Add'
      click_button 'Log out'
    end

    scenario 'User can see venues available on their search dates and is able to send a booking request' do
      visit '/'
      click_on 'Sign up'
      fill_in :email, with: 'hello@hello.com'
      fill_in :password, with: 'password123'
      click_button 'Sign up'
      click_button 'Book'
      fill_in :start_date, with: '01/03/2019'
      fill_in :end_date, with: '23/03/2019'
      click_button 'Search'
      expect(page.current_path).to eq '/book'
      expect(page).to have_content 'Oak tavern'
      expect(page).to have_content '1 Oak tavern Street'
      expect(page).to have_content 20
      expect(page).to have_content 'Best flat/tavern for getting pissed'
      expect(page).to have_content '01/03/2019'
      expect(page).to have_content '23/03/2019'
      click_link 'Book this property'
      expect(page).to have_content 'Thank you for your request, the owner will be in touch shortly!'
    end
  end
end
