module Api::V1
  class SurveyResultsController < ApplicationController

    def index
      @survey_results =
        if params[:email].present?
          SurveyResult.where(email: params[:email]).order(created_at: :desc)
        else
          []
        end
      json_response(@survey_results)
    end

    def show
      @result =
        if params[:email].present?
          SurveyResult.find_by(id: params[:id], email: params[:email])
        else
          error_json_response('You need to input email', :not_found)
          return
        end
    end
  end
end
