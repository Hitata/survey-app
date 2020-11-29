module Api::V1::Publishers
  class SurveysController < PublisherApiController
    def index
      @surveys = Survey.active.order(created_at: :desc)
      json_response(@surveys)
    end

    def show
      @survey = Survey.active.find(params[:id])
      json_response(@survey)
    end
  end
end
