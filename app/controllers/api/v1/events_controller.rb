class Api::V1::EventsController < Api::V1::ApplicationController

  def index
    events = Event.search_by_filters(filter_params)
    render json: events, each_serializer: EventSerializer
  end

  private

  def filter_params
    {
      city_id: params[:city_id].to_i,
      start_at: params[:start_at],
      end_at: params[:end_at],
      topic_id: params[:topic_id].to_i
    }
  end
end