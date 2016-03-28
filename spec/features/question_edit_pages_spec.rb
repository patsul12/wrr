require 'rails_helper'

describe 'the update a question path' do
  it 'allows a user to update a question', js: true do
    create(:question_with_answers)
    visit root_path
    click_link "edit"
    fill_in 'question_answer_a_content', with: 'updated answer A'
    fill_in 'question_answer_b_content', with: 'updated answer B'
    click_button "Submit"
    expect(page).to have_content('updated answer A')
    expect(page).to have_content('updated answer B')
  end
end
