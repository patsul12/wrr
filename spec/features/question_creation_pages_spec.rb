require 'rails_helper'

describe 'the question creation path' do
  it 'allows a user to create a question with valid parameters', js: true do
    visit root_path
    click_button 'Add a Question'
    fill_in 'question[content]', with: 'test question?'
    click_button 'Create a Question'
    expect(page).to have_content('test question?')
    expect(page).to have_css('div.question-tile')
  end
end
