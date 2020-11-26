class Api::SurveysController < ApplicationController
  def index
    @surveys = Survey.active.order(created_at: :desc)
  end

  def show
    @survey = Survey.active.find(params[:id])
  end
end
