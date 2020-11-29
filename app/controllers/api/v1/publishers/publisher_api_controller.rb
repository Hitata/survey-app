module Api::V1::Publishers
  class PublisherApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_publisher!
  end
end
