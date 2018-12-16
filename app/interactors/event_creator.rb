class EventCreator
  class EventCreationError < StandardError; end
  include Interactor

  def call
    context.event = Event.new
    context.event.name = context.event_name
    context.event.start_at = context.start_at
    context.event.end_at = context.end_at
    context.event.city_id = context.city_id
    context.fail!(error: context.event.errors.messages) unless context.event.save

    JSON.parse(context.topics).each do |topic_id|
      context.event.topics << Topic.find(topic_id.to_i)
    end
  end
end