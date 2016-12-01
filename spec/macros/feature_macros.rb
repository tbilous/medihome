module FeatureMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on t('devise.sessions.new.sign_in')
  end

  def sign_out
    within '#nav-mobile' do
      click_on t('layouts.header.sign_out')
    end
  end

  def mail_confirmation(email)
    fill_in 'email', with: email
    click_button 'submit'
  end
end
