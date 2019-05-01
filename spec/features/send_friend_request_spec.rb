# frozen_string_literal: true

require 'rails_helper'
require 'feature_test_helpers'

RSpec.feature 'Send friend request', type: :feature do
  scenario 'from the user profile page' do
    sign_up
    click_link('Logout')
    sign_up_2
    click_link('All Users')
    click_link('Add friend')
    expect(current_path).to include('/users')
    expect(page).to have_content("Ahhh! Yoda's little friend you seek!")
  end

  scenario "cannot add yourself as a friend" do
    sign_up
    click_link('My friends')
    expect(page).to_not have_content('Add friend')
  end
end
