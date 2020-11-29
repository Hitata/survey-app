module Api::V1::Publishers
  class QuestionsController < PublisherApiController
    def index
      @questions = current_publisher.questions.order(created_at: :desc)
      json_response(@questions)
    end

    def show
      @question = current_publisher.questions.find(params[:id])
      json_response(@question)
    end

    def create
      survey = current_publisher.surveys.find(params[:survey_id])
      @question = Question.new(create_params)
      @question.survey = survey
      @question.save
      json_response(@question)
    end

    def update
      @question = current_publisher.questions.find(params[:id])
      @question.update(update_params)
      json_response(@question)
    end

    def destroy
      @question = current_publisher.questions.find(params[:id])
      @question.destroy
      json_response(@question)
    end

    private

    def create_params
      params
        .permit(
          :title,
          :options
        )
    end

    def update_params
      params
        .permit(
          :title,
          :options
        )
    end
  end
end
