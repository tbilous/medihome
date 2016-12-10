require 'acceptance_helper'

feature 'user can login', %q{
  User can to register
  User can to Sign in
} do
  context 'this is new user' do
    let!(:user_params) { attributes_for(:user) }
    scenario 'Sign Up ' do
      visit root_path

      within '#nav-mobile' do
        click_on t('layouts.header.sign_up')
      end

      expect(page).to have_title t('page.sign_up')

      fill_in 'user_email', with: user_params[:email]
      fill_in 'user_name', with: user_params[:name]
      fill_in 'user_password', with: user_params[:password]
      fill_in 'user_password_confirmation', with: user_params[:password_confirmation]

      within '#new_user' do
        page.find('#SignUpSubmit').click
      end

      expect(current_path).to eq root_path
      wait_animation
      expect(page).to have_content t('devise.registrations.signed_up')
    end
  end

  context 'user is created' do
    let!(:user) { create(:user) }
    scenario 'Sign In' do
      visit root_path

      within '#nav-mobile' do
        click_on t('layouts.header.sign_in')
      end

      expect(page).to have_title t('page.sign_in')

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password

      within '#new_user' do
        click_on t('devise.sessions.new.sign_in')
      end

      expect(current_path).to eq root_path
      expect(page).to have_link t('layouts.header.sign_out')
      expect(page).to_not have_link t('layouts.header.sign_up')
      expect(page).to_not have_link t('layouts.header.sign_in')
      expect(page).to have_content t('devise.sessions.signed_in')
    end

    scenario 'Sign Out' do
      sign_in(user)
      # noinspection RubyArgCount
      sign_out
      expect(page).to have_content t('devise.sessions.signed_out')
    end
  end
end
