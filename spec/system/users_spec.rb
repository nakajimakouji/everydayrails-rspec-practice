require 'rails_helper'

RSpec.describe "Users", type: :system do
  scenario "create a new user" do
    visit root_path
    click_link "Sign up"
    fill_in "First name", with: "geho" 
    fill_in "Last name", with: "geho"
    fill_in "Email", with: "gehogeho@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content "Projects"
    expect(page).to have_link "geho geho", href: "/users/edit"
  end

  scenario "edit current user" do
    user = FactoryBot.create(:user)
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Projects"
    expect(page).to have_link user.name, href: "/users/edit"

    click_link user.name
    expect(page).to have_content "Edit User"

    fill_in "Email", with: user.email
    fill_in "First name", with: user.first_name
    fill_in "First name", with: user.last_name
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    fill_in "Current password", with: user.password
    click_button "Update"
    expect(page).to have_current_path root_path
    expect(page).to have_content "Your account has been updated successfully."
  end
end
