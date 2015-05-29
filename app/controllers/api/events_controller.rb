class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    request_ref = request.env['HTTP_ORIGIN']
    domain_name = request_ref.sub(/^https?\:\/\//, '').sub(/^www./, '')
    domain = Domain.find_by(url:domain_name)
    
    if !domain
      render json: "URL not recognized", status: :unprocessable_entity
    else
      e = domain.events.new(event_params)
      if e.save
        render json: e, status: :created
      else
        render e.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_name)
  end
end