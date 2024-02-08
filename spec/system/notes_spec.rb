require 'rails_helper'

RSpec.describe "Notes", type: :system do
  scenario "add a note" do
    user = FactoryBot.create(:user)
    project = FactoryBot.create(:project)
    visit root_path
  end
end