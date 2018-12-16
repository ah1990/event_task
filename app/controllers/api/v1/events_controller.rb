class Api::V1::EventsController < Api::V1::ApplicationController

  def index
    events = Event.search_by_filters(filter_params)
    render json: events, each_serializer: EventSerializer
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @event = Event.new
        @event.name = params[:event_name]
        @event.start_at = params[:start_at] || DateTime.now - 20.hours
        @event.end_at = params[:end_at] || DateTime.now
        @event.city_id = params[:city_id] || 1
        @event.save
        JSON.parse(params[:topics]).each do |topic_id|
          @event.topics << Topic.find(topic_id.to_i)
        end
      end
    rescue StandardError
      render json: { message: 'Check params please' }, status: :unprocessable_entity
    end

    render json: @event, serializer: EventSerializer
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