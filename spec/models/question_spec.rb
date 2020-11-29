require 'rails_helper'

RSpec.describe Survey, type: :model do
  let(:survey) { build(:survey) }
  subject(:question) {
    Question.new(
      survey: survey,
      options: ['option 1', 'option 2'],
      title: 'question 1'
    )
  }

  it 'is valid with options and title' do
    is_expected.to be_valid
  end

  context 'has association' do
    it 'of belongs_to survey' do
      is_expected.to belong_to(:survey)
    end
  end

  context 'has validations' do
    it 'of presence: title' do
      is_expected.to validate_presence_of(:title)
    end
  end
end
