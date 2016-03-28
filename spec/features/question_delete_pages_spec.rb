require 'rails_helper'

describe 'the question deletion path' do
  it 'allows a user to delete a question', js: true do
    create(:question_with_answers)
    visit root_path
    click_link 'delete'
    expect(page).to_not have_content("test question")
  end
end
