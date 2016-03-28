require 'rails_helper'

RSpec.describe Question, type: :model do
  it { validate_presence_of :content }
end
