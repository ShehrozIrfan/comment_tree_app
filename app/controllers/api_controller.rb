class ApiController < ApplicationController
  before_action :set_default_request_format

  private

  def set_default_request_format
    request.format = :json
  end
end
