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
    end

    private

    def create_params
      params
        .permit(
          :title,
          :options
        )
    end
  end
end
