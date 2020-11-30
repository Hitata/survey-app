module Api::V1
  class SurveysController < ApplicationController

    def index
      @surveys = Survey.active.order(created_at: :desc)
      json_response(@surveys)
    end

    def show
      @survey = Survey.active.find(params[:id])
    end

    def answer
      @result = SurveyResult.create(email: answer_params[:email])
      result.answers.create(answer_params[:answers])
    end

    private

    def answer_params
      params
        .require(:email)
        .permit(
          answers: [
            :question_id,
            :answer
          ]
        )
    end
  end
end
