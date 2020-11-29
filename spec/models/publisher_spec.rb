require 'rails_helper'

RSpec.describe Publisher, type: :model do
  subject(:publisher) { build(:publisher) }

  it 'is valid with name and email' do
    is_expected.to be_valid
  end

  context 'has association' do
    it 'of has_many surveys' do
      is_expected.to have_many(:surveys)
    end
  end

  context 'has validations' do
    it 'of presence: name' do
      is_expected.to validate_presence_of(:name)
    end
  end

  context 'has table indexes' do
    it 'of email' do
      is_expected.to have_db_index(:email)
    end
    it 'of [:uid, :provider]' do
      is_expected.to have_db_index(%i[uid provider]).unique(true)
    end
  end
end
