require 'rails_helper'

RSpec.describe "Survey API", type: :request do
  describe "GET /api/surveys" do
    let!(:surveys) { create_list :active_survey, 5 }
    let(:path) { '/api/surveys' }

    include_context :subject_get

    describe 'Response successful' do
      context 'show all active surveys' do
        it { is_expected.to have_http_status(:ok) }
        it { expect(data.count).to eq(5) }
        it do
          expect(data[0]).to include_json(
            id: surveys.last.id,
            title: surveys.last.title,
          )
        end
      end
    end
  end

  describe "GET /api/surveys/:id" do
    let!(:survey) { create :active_survey }
    let(:id) { survey.id.to_s }
    let(:path) { '/api/surveys/' + id }

    include_context :subject_get

    describe 'Response successful' do
      context 'show active survey by :id' do
        it { is_expected.to have_http_status(:ok) }
        it do
          expect(data).to include_json(
            id: survey.id,
            title: survey.title,
          )
        end
      end
    end
  end
end
