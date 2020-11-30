module Api::V1
  class SurveysController < ApplicationController

    def index
      @surveys = Survey.active.order(created_at: :desc)
    end

    def show
      @survey = Survey.active.find(params[:id])
    end

    def answer
      survey = Survey.active.find(params[:survey_id])
      @result = SurveyResult.create(survey: survey, email: answer_params[:email])
      @result.survey_answers.create(answer_params[:answers])
    end

    private

    def answer_params
      params
        .permit(
          :email,
          answers: [
            :question_id,
            :answer
          ]
        )
    end

    def results_params
      params.require(:email)
    end
  end
end
