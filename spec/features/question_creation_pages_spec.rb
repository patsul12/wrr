require 'rails_helper'

describe 'the question creation path' do
  it 'allows a user to create a question with valid parameters', js: true do
    visit root_path
    click_link 'Add a Question'
    fill_in 'question_answer_a_content', with: 'test answer A'
    fill_in 'question_answer_b_content', with: 'test answer B'
    click_button 'Submit'
    expect(page).to have_content('test answer A')
    expect(page).to have_content('test answer B')
    expect(page).to have_css('div.question-tile')
  end
end
