require 'acceptance_helper'

feature 'user can login', %q{
  User can to register
  User can to Sign in
} do
  context 'this is new user', :js do
    let!(:user_params) { attributes_for(:user) }
    scenario 'Sign Up ' do
      visit root_path
      within '#nav-mobile' do
        click_on t('.sign_up')
      end
      # save_and_open_page

      expect(page).to have_title t('.sign_up')

      fill_in 'user_email', with: user_params[:email]
      fill_in 'user_name', with: user_params[:name]
      fill_in 'user_password', with: user_params[:password]
      fill_in 'user_password_confirmation', with: user_params[:password_confirmation]
      within '#new_user' do
        click_on t('devise.registrations.new.sign_up')
      end

      expect(current_path).to eq root_path
    end
  end
  context 'user is created' do
    let!(:user) { create(:user) }
    scenario 'Sign In' do
      visit root_path
      within '#nav-mobile' do
        click_on t('devise.sessions.new.sign_in')
      end

      expect(page).to have_title t('page.sign_in')
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      within '#new_user' do
        click_on t('devise.sessions.new.sign_in')
      end

      expect(current_path).to eq root_path
      expect(page).to have_link 'Sign out'
      expect(page).to_not have_link t('devise.registrations.new.sign_up')
      expect(page).to_not have_link t('devise.sessions.new.sign_in')
    end
  end
end
