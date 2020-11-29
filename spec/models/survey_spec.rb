require 'rails_helper'

RSpec.describe Survey, type: :model do
  let(:publisher) { build(:publisher) }
  subject(:survey) { Survey.new(publisher: publisher, title: 'survey 1') }

  it 'is valid with publisher and title' do
    is_expected.to be_valid
  end

  context 'has association' do
    it 'of belongs_to publisher' do
      is_expected.to belong_to(:publisher)
    end
  end

  context 'has validations' do
    it 'of presence: title' do
      is_expected.to validate_presence_of(:title)
    end
  end
end
