class Api::V1::EventsController < Api::V1::ApplicationController

  def index
    events = Event.search_by_filters(filter_params)
    render json: events, each_serializer: EventSerializer
  end

  def create
    result = CreateEvent.call(event_name: params[:event_name],
                              start_at: params[:start_at],
                              end_at: params[:end_at],
                              city_id: params[:city_id],
                              topics: params[:topics])

    if result.success?
      render json: result.event, serializer: EventSerializer
    else
      render json: result.error, status: :unprocessable_entity
    end
  end

  private

  def filter_params
    {
      city_id: params[:city_id],
      start_at: params[:start_at],
      end_at: params[:end_at],
      topic_id: params[:topic_id]
    }
  end
end