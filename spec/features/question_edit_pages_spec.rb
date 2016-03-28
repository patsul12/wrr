require 'rails_helper'

describe 'the update a question path' do
  it 'allows a user to update a question', js: true do
    create(:question)
    visit root_path
    click_link "edit"
    fill_in 'question[content]', with: "updated question"
    click_button "Submit"
    expect(page).to have_content('updated question')
  end
end
