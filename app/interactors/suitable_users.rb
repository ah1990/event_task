class SuitableUsers
  include Interactor

  def call
    event = context.event
    context.current_data = {
      city_id: event.city_id,
      start_at: event.start_at,
      end_at: event.end_at,
      topic_ids: event.topics.pluck(:id)
    }

    user_ids = []
    EventFilter.all.each do |f|
      next unless f.body['city_id'].nil? || f.body['city_id'].to_i == context.current_data[:city_id]
      next unless f.body['start_at'].nil? || f['start_at'] == context.current_data[:start_at]
      next unless f.body['end_at'].nil? || f['end_at'] == context.current_data[:start_at]
      next unless f.body['topic_id'].nil? || f.body['topic_id'].to_i.in?(context.current_data[:topic_ids])
      user_ids << f.user_id
    end
    context.user_ids = user_ids.uniq
  end
end