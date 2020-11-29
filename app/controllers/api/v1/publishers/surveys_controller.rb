module Api::V1::Publishers
  class SurveysController < PublisherApiController
    def index
      @surveys = current_publisher.surveys.order(created_at: :desc)
      json_response(@surveys)
    end

    def show
      @survey = current_publisher.surveys.find(params[:id])
      json_response(@survey)
    end

    def create
      @survey = current_publisher.surveys.create(create_params)
      json_response(@survey)
    end

    def update
      @survey = current_publisher.surveys.find(params[:id])
      @survey.update(update_params)
      json_response(@survey)
    end

    def destroy
      @survey = current_publisher.surveys.find(params[:id])
      @survey.destroy
      json_response(@survey)
    end

    private

    def create_params
      params
        .permit(
          :title
        )
    end

    def update_params
      params
        .permit(
          :title,
          :active
        )
    end
  end
end
